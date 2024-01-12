class Public::SessionsController < Devise::SessionsController
before_action :user_state, only: [:create]

def after_sign_in_path_for(resource)
  user_path(current_user)
  #ログインしたら、ユーザー詳細(ログインしているユーザー)に遷移
end

def after_sign_out_path_for(resource)
  new_user_session_path
  #ログアウトしたら、ログイン画面に遷移
end

#ゲストログインに関する記述
def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: "guestuserでログインしました。"
    #ゲストログインとしてマイページへ遷移する
end

private

def user_state
  user = User.find_by(email: params[:user][:email])
  return if user.nil?
  if user.is_active
    return unless user.valid_password?(params[:user][:password])
  else
    redirect_to  new_user_registration_path
    #新規登録画面へリダイレクト
  end
end



end
