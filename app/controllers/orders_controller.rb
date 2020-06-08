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
    #binding.pry
    @cart_products = CartProduct.all
    @orders = Order.all
    session[:order]=params[:order][:payment_method]
    session[:order]=params[:order][:address]
    session[:order]=params[:order][:post_code]
    session[:order]=params[:order][:name]

   # if  order_id "address_1"
    #  order.address = 'address_1'
   # elsif
     # 'address_2'
   # else
     # 'address_3'
    #  address_1 = "新しいお届け先"
    #  address_2 = "登録済みの住所"
    #  address_3= "新しいお届け先"
   # end
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
