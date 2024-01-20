class Admin::PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :post_image)
  end

end
