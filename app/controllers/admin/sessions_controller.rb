class Admin::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    admin_users_path
    #会員一覧画面に遷移する
  end

  def after_sign_out_path_for(resource)
    admin_session_path
     #ログアウトしたら、ログイン画面に遷移する。
  end

end
