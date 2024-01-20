class Admin::SessionsController < Devise::SessionsController


  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました！"
    admin_users_path
  end

  def after_sign_out_path_for(resource)
    flash.clear
    flash[:alert] = "ログアウトしました"
    admin_session_path
  end

end
