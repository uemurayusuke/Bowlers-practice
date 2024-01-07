class Public::SessionsController < Devise::SessionsController

def after_sign_in_path_for(resource)
  #ログインしたら、マイページに遷移。
end

def after_sign_out_path_for(resource)
  #ログアウトしたら、ログイン画面に遷移。
end

# private

# def customer_state
#   customer = Customer.find_by(email: params[:customer][:email])
#   return if customer.nil?
#   if customer.is_active
#     return unless customer.valid_password?(params[:customer][:password])
#   else
#     redirect_to  new_customer_registration_path
#   end
# end


end
