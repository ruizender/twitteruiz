class HomeController < ApplicationController
    skip_before_action :authenticate_user!
  def index
    
    if user_signed_in?
      @tweets = Tweet.tweets_for_me(current_user).order("created_at DESC")
    elsif params[:q].present?
        @tweets = Tweet.where('textweet LIKE ?', "%#{params[:q]}%")
    else
      @tweets = Tweet.all.order("created_at DESC")
    end
    
#queda pendiente arreglar problema de que no funciona el buscador
    @tweets = Kaminari.paginate_array(@tweets).page(params[:page]).per(50)
    @tweet = Tweet.new
    @like = Like.new
    @friends = Friend.all
    @friend = Friend.new
  end
end
