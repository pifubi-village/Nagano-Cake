class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.page(params[:page]).reverse_order
  end

  def show
  	@order = Order.find(params[:id])
  	@order_products = @order.order_products.all
  end

  def update
      # 注文ステータス更新＝＞製作ステータス自動更新
  	order = Order.find(params[:id])
    if order.update(order_params)
      # 入金確定＝＞製作待ち　
      if order.oeder_status == "入金確定"
        order_products = order.order_products
        order_products.each do |order_product|
         order_product.update(production_status: "製作待ち")
        end
      end
     redirect_back(fallback_location: root_path)
    else
     redirect_back(fallback_location: root_path)
    end
  end

  private
  def order_params
  	params.require(:order).permit(:oeder_status)
  end

  def order_product_params
    params.require(:order_product).permit(:production_status)
  end
end
