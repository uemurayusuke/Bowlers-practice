class Admins::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    root_path
    #会員一覧画面に遷移す
  end

  def after_sign_out_path_for(resource)
    root_path
     #ログアウトしたら、ログイン画面に遷移する。
  end

end
