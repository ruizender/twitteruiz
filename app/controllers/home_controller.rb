class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @tweets = Tweet.order("created_at DESC")
    @tweets = Kaminari.paginate_array(@tweets).page(params[:page]).per(50)
    @tweet = Tweet.new
    @like = Like.new
  end
end
