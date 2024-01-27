class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    flash[:notice] = "新規登録完了しました！"
    user_path(current_user)
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :email,
        :user_name,
        :introduction,
        :is_active
      ]
    )
  end
end

# 整理完了