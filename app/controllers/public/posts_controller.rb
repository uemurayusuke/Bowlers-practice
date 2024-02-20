class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_name].split(',')

    if @post.save
      @post.save_tags(tag_list)
      flash[:notice] = "投稿が完了しました"
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def index
    if params[:latest]
      @posts = Post.latest.page(params[:page])
    elsif params[:old]
      @posts = Post.old.page(params[:page])
    else
      @posts = Post.page(params[:page]).order(created_at: :desc)
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:alert] = "投稿が削除されました"
    redirect_to user_path(current_user)
  end

  def destroy_posts
  end

  def destroy_all
    posts = Post.where(user_id: current_user.id)
    posts.destroy_all
    flash[:alert] = "投稿が全て削除されました"
    redirect_to user_path(current_user)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @can_delete = user_signed_in? && current_user == @post.user
  end

  private

  def post_params
    params.require(:post).permit(:caption, :post_image)
  end
end





# 整理完了