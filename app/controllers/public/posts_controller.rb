class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
  if @post.save
    redirect_to user_path(@post)
    #投稿したユーザー詳細画面に飛ぶ
  else
    render :new
  end
  end

  def index
    @posts = Post.all
  end

  def destroy
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:caption, :post_image)
  end

end
