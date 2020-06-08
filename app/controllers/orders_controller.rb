class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @end_user = EndUser.all

  end

  def show
    @order = Order.find(params[:id])
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
      redirect_to orders_confirm_path
    end
  end

  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    redirect_to orders_confirm_path(@order.id)
    end

  def confirm

    @cart_products = CartProduct.all
    @orders = Order.all
    session[:order] = params[:order]
    #binding.pry

    @order =Order.new
    if params[:order][:payment_method] == "0"
      @order.payment_method = "cash"
    else @order.payment_method = "クレジット"
    end

    @order = Order.new
    if params[:order][:address_status] == "0"
      @order.address = current_end_user.address
    elsif  params[:order][:address_status] == "1"
      #@order.address = addresses.current_end_user.address_id.

    elsif address_status == "2"
    end
  end

  def complete
    @order = Order.new(Order_params)
    @order.save
    redirect_to orders_path
  end

  private
  def order_params
    params.require(:order).permit(:postage,:amount_price,:oeder_status,:address,:name,:post_code,:payment_method)
  end
end
