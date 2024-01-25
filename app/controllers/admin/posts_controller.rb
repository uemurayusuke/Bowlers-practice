class Admin::PostsController < ApplicationController
   before_action :authenticate_admin!

  def index
    if params[:latest]
      @posts = Post.latest.page(params[:page])
    elsif params[:old]
      @posts = Post.old.page(params[:page])
    else
      @posts = Post.page(params[:page])
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:alert] = "投稿が削除されました"
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :post_image)
  end

end
