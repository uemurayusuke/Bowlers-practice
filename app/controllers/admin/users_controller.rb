class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
     @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集が完了しました"
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end
end

private

def user_params
  params.require(:user).permit(
  :last_name,
  :first_name,
  :last_name_kana,
  :first_name_kana,
  :user_name,
  :email,
  :introduction,
  :is_active
  )
end
