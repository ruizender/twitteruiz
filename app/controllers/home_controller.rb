class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @tweets = Tweet.order("created_at")
    @tweets = Kaminari.paginate_array(@tweets).page(params[:page]).per(2)
  end
end
