class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	 protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:first_name, :first_name_kana, :family_name, :family_name_kana, :phone_number, :email, :post_code, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :first_name_kana, :family_name, :family_name_kana, :phone_number, :email, :post_code, :address])
  end
end
