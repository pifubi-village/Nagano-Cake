class CartProductsController < ApplicationController
  def index
      @products = current_end_user.cart_products
      @total_price = 0
      @products.each do |product|
      @total_price += price_tax_excluded
  end
end

  def add_product
    if CartProduct.find_by(product_id: params[:product_id], cart_product_id: current_end_user_cart.id).blank?
      @cart_product = current_product_cart.cart_products.create(product_id: params[:product_id])
    end

    @cart_product.save!
    redirect_to current_cart
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
    @cart_product = CartProduct.find_by(id: @end_user.product_id)
    @cart_product.product.destroy.all
    redirect_to cart_products_path
  end
  def cart_product_params
      params.require(:cart_product).permit(:product_id,:end_user_id,:number)
  end
end
