class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!


  def create
    @user = User.find(params[:user_id])
    following = current_user.follow(@user)
    following.save

  end

  def destroy
    @user = User.find(params[:user_id])
    following = current_user.unfollow(@user)
    following.destroy

  end

  def followings
    user = User.find(params[:user_id])
		@users = user.followings.page(params[:page])
  end

  def followers
    user = User.find(params[:user_id])
		@users = user.followers.page(params[:page])
  end

end
