class Admins::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    #会員一覧画面に遷移する。
  end

  def after_sign_out_path_for(resource)
     #ログアウトしたら、ログイン画面に遷移する。
  end

end
