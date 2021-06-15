class FriendsController < ApplicationController
  before_action :set_user
  
    def create
  
      @friend = Friend.create(user_id: current_user.id, friend_id: params[:id])
      redirect_to root_path, notice: "Now you have a new friend"
      
    end
  
    def destroy
      @friend.destroy, flash[:notice] = "Successfully unfollowed"
      redirect_to root_path
    end
  
    private
    
    def set_user
      @user = Tweet.find(current_user.id)
    end

  end
