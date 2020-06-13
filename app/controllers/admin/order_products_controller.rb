class Admin::OrderProductsController < ApplicationController

	def update
		# 製作ステータス更新＝＞注文ステータス自動更新
    order_product = OrderProduct.find(params[:id])
     order = order_product.order
    if order_product.update(order_product_params)
      # 制作中＝＞製作中自動更新
      if order_product.production_status == "製作中"
         order.update(oeder_status: "制作中自動更新")
      end

      # 製作完了＝＞発送準備中
      # 全ての種類の商品が製作完了になったら自動更新されるようにする
      flag = 0
      order.order_products.each do |order_product|
       if order_product.production_status != "製作完了"
        flag = 1
        break
       end
      end
      if flag == 0
        order.update(oeder_status: "発送準備中")
      end
    end
      redirect_back(fallback_location: root_path)
	end
  
	private
	  def order_product_params
	    params.require(:order_product).permit(:production_status)
	  end

end