class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @end_user = EndUser.all

  end
   def confirm

  end

  def complete
    order = Order.new (session[:order])
    order.save
    cart_products = current_end_user.cart_products
    cart_products.each do |cart|
      order_product = OrderProduct.new
      order_product.product_id = cart.product.id
      order_product.number = cart.number
      order_product.price_tax_included = (cart.product.price_tax_excluded * 1.1).round
      order_product.production_status = 0
      order_product.order_id = order.id
      #binding.pry
      order_product.save
  end
    cart_products.destroy_all
  end

  def new
    @addresses = Address.all
    @orders = Order.all
    @order = Order.new
    @end_user = current_end_user
  end
  def update
    @order = Order.find(params[:id])
    if @order.save
    end
  end
  def show
    @order = Order.find(params[:id])
  end
  def create

    session[:order] = Order.new
    #binding.pry
    session[:order][:payment_method] = params[:payment_method]

    if params[:address_status] == "0"
      session[:order][:address] = current_end_user.address
      session[:order][:post_code]= current_end_user.post_code
      session[:order][:name] = current_end_user.family_name + current_end_user.first_name
    elsif  params[:address_status] == "1"
      address = Address.find(params[:address_collection])
      session[:order][:address] = address.address
      session[:order][:post_code] = address.post_code
      session[:order][:name] = address.name
    elsif params[:address_status] == "2"
      session[:order][:address] = params[:address]
      session[:order][:post_code] = params[:post_code]
      session[:order][:name] = params[:name]
    end
    session[:order][:postage] = 800
    @cart_products = CartProduct.all
     sum = 0
    @cart_products.each do |cp|
      sum += cp.product.price_tax_excluded*cp.number.to_i
    end
    session[:order][:amount_price] = session[:order][:postage]+sum
    session[:order][:end_user_id] = current_end_user.id
    session[:order][:oeder_status] = "入金待ち"
    redirect_to  confirm_orders_path
  end



  private
  def order_params
    params.require(:order).permit(:postage,:amount_price,:oeder_status,:address,:name,:post_code,:payment_method)
  end
end

