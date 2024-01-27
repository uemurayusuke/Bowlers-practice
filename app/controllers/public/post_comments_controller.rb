class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = post.id

    if @comment.save
      render 'create.js.erb'
    else
      render :validater
    end
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
    render 'destroy.js.erb'
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end

# 整理完了