class ProductsController < ApplicationController

  def index
  	@products = Product.all
  end

  def show
  	@products = Product.all
  	@product = Product.find(params[:id])
  end
   def create
   	@product = Product.find(params[:id])
   	if  @product.save
   		redirect_to cart_products_path
   	end
   end

end
