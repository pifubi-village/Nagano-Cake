class HomesController < ApplicationController
	def top
	 if params[:genre_id]
        @products = Product.joins(:genre).where(genres: {is_active: true, id: params[:genre_id]}).page(params[:page]).per(5).reverse_order
    else
  	    @products = Product.joins(:genre).where(genres: {is_active: true}).page(params[:page]).per(5).reverse_order
    end
	    @genres = Genre.all
	end

	def about
	end
end
