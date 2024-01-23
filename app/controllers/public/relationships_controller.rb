class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!


  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
		 render 'replace_follow_btn.js.erb'
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
		render 'replace_favorites_btn.js.erb'
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
