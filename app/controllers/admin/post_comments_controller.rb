class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post_comments = PostComment.page(params[:page]).per(5)
    @users = User.all
  end

  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    flash[:alert] = "コメントが削除されました"
    redirect_to request.referer
  end
end

# 整理完了