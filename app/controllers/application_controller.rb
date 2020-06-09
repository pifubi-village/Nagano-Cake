class ApplicationController < ActionController::Base
	 before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
  	case resource
  	when @admin
  		admin_homes_top_path
  	when @end_user
  		root_path
  	end
  end

  

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:first_name_kana,:family_name,:family_name_kana,:phone_number,:post_code,:address,:email])
  end
end