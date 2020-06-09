class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @end_user = EndUser.all

  end
   def confirm
    @cart_products = CartProduct.all
    session[:order] = params[:order]
    #binding.pry
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address_status] == "0"
      @order.address = current_end_user.address
      @order.post_code = current_end_user.post_code
      @order.name = current_end_user.name
    elsif  params[:order][:address_status] == "1"
      @address = Address.find(params[:order][:address])
      @order.address = @address.address
      @order.post_code = @address.post_code
      @order.name = @order.name
    elsif params[:order][:address_status] == "2"
      @order.address = params[:address]
      @order.post_code = params[:post_code]
      @order.name = params[:name]
    end

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

  def create
    @order = Order.new(order_params)
    @order.save
    
  end

 

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:postage,:amount_price,:oeder_status,:address,:name,:post_code,:payment_method)
  end
end
