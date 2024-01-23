class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end

  def edit
    @user = current_user
  end


  def update
     @user = current_user
     if @user.update(user_params)
      flash[:notice] = "編集が完了しました"
      redirect_to user_path(@user)
     else
      render "edit"
     end
  end

  def unsubscribe
  end

  def withdraw
    user = current_user
    user.update(is_active: false)
    sign_out(user)
    flash[:alert] = "退会しました"
    redirect_to root_path
  end

  def favorites
    user = User.find(params[:id])
    favorites = user.favorites.includes(:post).pluck(:post_id)
    @favorite_posts = Post.where(id: favorites).page(params[:page])
  end


  def following_posts
   @posts = Post.where(user_id: [*current_user.following_ids])
    if params[:latest]
       @page_posts = @posts.latest.page(params[:page])
    elsif params[:old]
       @page_posts = @posts.old.page(params[:page])
    else
       @page_posts = @posts.page(params[:page])
    end
  end





  private

  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end
