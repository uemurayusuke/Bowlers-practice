class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = current_user
  end


  def update
     @user = current_user
     if @user.update(user_params)
      redirect_to user_path(@user)
      #ユーザー詳細ページへ
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
    redirect_to root_path
  end

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
