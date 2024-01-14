class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
   tag_list = params[:post][:tag_name].split(',')

  if @post.save
     @post.save_tags(tag_list)
    #save_tagsはpostモデルに定義されている。
    redirect_to user_path(current_user)
    #投稿したユーザー詳細画面に飛ぶ
  else
    render :new
  end
  end



  def index
    if params[:latest]
      @posts = Post.latest
    else
      @posts = Post.all
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def destroy_all
    posts = Post.where(user_id: current_user.id)
    posts.destroy_all
    redirect_to request.referer
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
