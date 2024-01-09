class Public::UsersController < ApplicationController

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
  end

  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image)
  end

end
