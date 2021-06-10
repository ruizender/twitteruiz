class LikesController < ApplicationController

  def create
    @user = current_user.id
    @product = params[:product_id]
    likes = {user_id: @user, product_id: @product}
    @like = Like.new(likes)

    @like.save!
    if @like.save
      redirect_to user_path(@user)
    else
    redirect_to product_path
    end
  end
end
