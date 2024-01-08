class Public::SessionsController < Devise::SessionsController
before_action :user_state, only: [:create]

def after_sign_in_path_for(resource)
  user_path(current_user)
  #ログインしたら、マイページに遷移
end

def after_sign_out_path_for(resource)
  new_user_session_path
  #ログアウトしたら、ログイン画面に遷移
end

private

def user_state
  user = User.find_by(email: params[:user][:email])
  return if user.nil?
  if user.is_active
    return unless user.valid_password?(params[:user][:password])
  else
    redirect_to  new_user_registration_path
    #リンク先を見直す
  end
end

end
