class Public::SessionsController < Devise::SessionsController
before_action :user_state, only: [:create]

def after_sign_in_path_for(resource)
  flash[:notice] = "ログインしました！"
  user_path(current_user)
end

def after_sign_out_path_for(resource)
  flash.clear
  flash[:alert] = "ログアウトしました"
  root_path
end


def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: "guestuserでログインしました!"
end

private

def user_state
  user = User.find_by(email: params[:user][:email])
  return if user.nil?
  if user.is_active
    return unless user.valid_password?(params[:user][:password])
  else
    redirect_to  new_user_registration_path, alert: "会員情報がありません。新規登録をしてください。"
  end
end



end
