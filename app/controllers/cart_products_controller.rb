class CartProductsController < ApplicationController
  def index
      @cart_products = CartProduct.all
      @products = current_end_user.cart_products
      @total_price = 0
  end

   def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.end_user_id = current_end_user.id
    @cart_product.save
    redirect_to cart_products_path
  end

  def add_product
  end

  def edit
    @cart_product = CartProduct.find(params[:id])
    if cart_product.end_user_id = current_end_user.id
    end
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    if cart_product.end_user_id = current_end_user.id
      @cart_product.save
      redirect_to cart_products_path
    end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  def destroy_all
    @cart_product = CartProduct.all
    @cart_product.destroy_all
    redirect_to cart_products_path
  end

  def cart_product_params
      params.require(:cart_product).permit(:product_id,:end_user_id,:number)
  end
end