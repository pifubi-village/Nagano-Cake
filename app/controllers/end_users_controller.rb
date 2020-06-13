class EndUsersController < ApplicationController
	before_action :authenticate_end_user!
	def show
		@end_user = current_end_user
	end
	def edit
		@end_user = current_end_user
	end

	def update
		@end_user = current_end_user
	 if	@end_user.update(end_users_params)
		redirect_to end_users_path
	else
		render "edit"
    end
   end

	def unsubscribed
		@end_user = current_end_user
	end

	def withdraw
		@end_user = current_end_user
        @end_user.update(is_active: false)
        reset_session
        redirect_to root_path
	end
	def zipedit
  	params.require(:end_user).permit(:postcode, :address)
	end

	private
	 def end_users_params
    	params.require(:end_user).permit(:email, :family_name, :first_name,
	     :family_name_kana, :first_name_kana, :phone_number, :post_code,
	     :address, :is_active)
  	end
 end