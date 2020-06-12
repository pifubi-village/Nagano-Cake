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
      if @order.oeder_status == "入金確定"
        @order_products = @order.order_products
        @order_products.each do |order_product|
        order_product.update(production_status: 1)
        
        end
      end
      redirect_back(fallback_location: root_path)
    else
       redirect_back(fallback_location: root_path)
    end
    # 注文ステータスが入金確定になったら製作ステータスが製作待ちになる
   #  if oeder_status = 1
   #    production_status


  	
  end

  private
  def order_params
  	params.require(:order).permit(:oeder_status)
  end
end
