class Admin::RelationshipsController < ApplicationController
  before_action :authenticate_admin!

  def followings
    user = User.find(params[:user_id])
    @users = user.followings.page(params[:page]).order(created_at: :desc)
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers.page(params[:page]).order(created_at: :desc)
  end
end

# 整理完了