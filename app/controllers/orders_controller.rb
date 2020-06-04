class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @order = Order.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @addresses = Address.all
    @orders = Order.all
    @order = Order.new
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
    params.require(:order).permit()
  end
end
