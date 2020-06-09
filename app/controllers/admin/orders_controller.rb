class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.page(params[:page]).reverse_order
  end

  def show
  	@order = Order.find(params[:id])
  	@order_products = Order.order_products.all
  end

  def update
  end
end
