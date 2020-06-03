class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    
  end

  def create
    @order = Order.find(params[:order_id])
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
