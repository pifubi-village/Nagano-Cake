class ProductsController < ApplicationController

  def index
  	@products = Product.all.page(params[:page]).per(10).reverse_order
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

  def cake
  	@products = Product.where(genre_id: 1).page(params[:page]).per(10).reverse_order
  end

  def pudding
    @products = Product.where(genre_id: 2).page(params[:page]).per(10).reverse_order
  end

  def candy
    @products = Product.where(genre_id: 3).page(params[:page]).per(10).reverse_order
  end

  def bakedgoods
    @products = Product.where(genre_id: 4).page(params[:page]).per(10).reverse_order
  end

  private
def cart_product_params
    params.require(:cart_product).permit(:end_user_id, :product_id, :number).reverse_order
end
end
