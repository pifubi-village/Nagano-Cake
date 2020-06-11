class HomesController < ApplicationController
	def top
		@products = Product.all
		@products = Product.page(params[:page]).per(4)
	end
	def about
	end
end
