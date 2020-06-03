class EndUsersController < ApplicationController
	def show
		@end_user = current_end_user
	end

	def unsubscribed
	end

	def withdraw
	end
 end