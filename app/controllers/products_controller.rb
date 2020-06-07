class ProductsController < ApplicationController

  def index
  	@products = Product.all
  end

  def show
  	@products = Product.find(params[:id])
  	@cart_product = CartProduct.new
  end

  def create
  	@cart_product = CartProduct.new(cart_product_params)
  	@cart_product.save
  	redirect_to cart_product_path
  end

  private
def cart_product_params
    params.require(:cart_product).permit(:end_user_id, :product_id, :number)
end
end
