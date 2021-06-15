class FriendsController < ApplicationController
    before_action :following, only: [:destroy]

    def create
      if following?
        flash[:notice] = "No puedes seguirte a ti mismo"
      else
        @follower.friends.create(user_id: current_user.id)
      end
      redirect_to root_path(@follower)
    end

    def destroy
      if following?
        @follower.destroy
      else
        flash[:notice] = "no has seguido" 
      end
      redirect_to root_path
    end
    
    private
    def following
      Friend.find_by(user_id: current_user.id, friend_id: params[:id]) != nil
    end
end
