class ProductsController < ApplicationController

  def index
    if params[:genre_id]
      # @products = Product.joins(:genre).where(genres: {id: params[:genre_id]}).page(params[:page]).per(10).reverse_order
      @products = Product.joins(:genre).where(genres: {is_active: true, id: params[:genre_id]}).page(params[:page]).per(10).reverse_order
    else
  	 @products = Product.joins(:genre).where(genres: {is_active: true}).page(params[:page]).per(10).reverse_order
    end
    @genres = Genre.all
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
