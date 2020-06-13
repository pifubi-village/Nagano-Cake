class Admin::OrderProductsController < ApplicationController

	def update

		# 製作ステータス更新＝＞注文ステータス自動更新
    order_product = OrderProduct.find(params[:id])
    if order_product.update(order_product_params)
      # 制作中＝＞製作中自動更新
      if order_product.production_status == "製作中"
        order = order_product.order
         order.update(oeder_status: "制作中自動更新")
      end
     	redirect_back(fallback_location: root_path)
    　else
    	# 　製作完了＝＞発送準備中
    	
     redirect_back(fallback_location: root_path)
    end
    


	end



	private
	  def order_product_params
	    params.require(:order_product).permit(:production_status)
	  end

end