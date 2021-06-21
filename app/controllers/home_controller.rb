class HomeController < ApplicationController
    skip_before_action :authenticate_user!
  def index
    
    if signed_in?
      @tweets = Tweet.tweets_for_me(current_user).order("created_at DESC")
      if params[:q].present?
        @tweets = Tweet.tweets_for_me(current_user).order("created_at DESC").where('textweet LIKE ?', "%#{params[:q]}%")
      end
    else
      @tweets = Tweet.all.order("created_at DESC")
      if params[:q].present?
        @tweets = Tweet.where('textweet LIKE ?', "%#{params[:q]}%")
      end
    end
    

    @tweets = Kaminari.paginate_array(@tweets).page(params[:page]).per(50)
    @tweet = Tweet.new
    @like = Like.new
    @friends = Friend.all
    @friend = Friend.new
  end

  def list_users
    @users = User.where.not(id: current_user.id)
    @friends = Friend.all
  end
end
