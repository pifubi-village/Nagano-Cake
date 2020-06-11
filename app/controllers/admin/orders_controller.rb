class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.page(params[:page]).reverse_order
  end

  def show
  	@order = Order.find(params[:id])
  	@order_products = @order.order_products.all
  end

  def update
  	@order = Order.find(params[:id])
  	if @order.update(order_params)
  		redirect_back(fallback_location: root_path)
  	end
  end

  private
  def order_params
  	params.permit(:oeder_status)
  end
end
