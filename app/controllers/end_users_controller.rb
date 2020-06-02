class EndUsersController < ApplicationController
	def show
		@end_user = current.user
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
