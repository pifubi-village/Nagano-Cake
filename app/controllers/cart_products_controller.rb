class CartProductsController < ApplicationController
   def index
      @cart_products = CartProduct.all
      @products = current_end_user.cart_products
      @sum = 0
      @cart_products.each do |cp|
        @sum += cp.product.price_tax_excluded*cp.number.to_i
   end
end
   def create
    cart_product = CartProduct.all
    isExist = false
    id = 0
    cart_product.each do |cart_product|
      if cart_product.product_id == cart_product_params[:product_id].to_i
        isExist = true
        id = cart_product.id
      end
    end

    if isExist
      cart_product = CartProduct.find(id)
      sum = cart_product.number.to_i + cart_product_params[:number].to_i
      cart_product.update_attributes(number:sum)
      redirect_to cart_products_path
    else
       cart_product = CartProduct.new(cart_product_params)
       cart_product.end_user_id = current_end_user.id
       cart_product.save
       redirect_to cart_products_path(current_end_user)
    end
  end

  def edit
       @cart_product = CartProduct.find(params[:id])
    if cart_product.end_user_id = current_end_user.id
    end
  end

  def update
      @cart_product = CartProduct.find(params[:id])
      @cart_product.end_user_id = current_end_user.id
      @cart_product.update(cart_product_params)
      redirect_to cart_products_path
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