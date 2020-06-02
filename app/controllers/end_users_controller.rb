class EndUsersController < ApplicationController
	def show
		@end_user = current_end_user
	end

	def edit
	end

	def update
	end

	def unsubscribed
	end

	def withdraw
	end
 end