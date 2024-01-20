class Admin::RelationshipsController < ApplicationController


  def followings
    user = User.find(params[:user_id])
		@users = user.followings.page(params[:page])
  end

  def followers
    user = User.find(params[:user_id])
		@users = user.followers.page(params[:page])
  end

end
