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
      redirect_to order_path
    end
  end

  def create
    @order = Order.find(params[:id])
    if @order.save
      redirect_to orders_confirm_path
    end
  end

  def confirm
    @order = Order.find(params[:id])
  end

  def complete
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:postage,:amount_price,:oeder_status,:address,:name,:post_code,:payment_method)
  end
end
