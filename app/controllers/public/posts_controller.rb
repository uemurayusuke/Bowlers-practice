class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
   tag_list = params[:post][:tag_name].split(',')

  if @post.save
     @book.save_tags(tag_list)
    redirect_to user_path(current_user)
    #投稿したユーザー詳細画面に飛ぶ
  else
    render :new
  end
  end

  def index
    @posts = Post.all
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  private

  def post_params
    params.require(:post).permit(:caption, :post_image)
  end

end
