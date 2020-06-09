class Admin::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @price_tax_included = (@product.price_tax_excluded*1.1).round(0)
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if  product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product.id)
  end

  private
    def product_params
      params.require(:product).permit(:genre_id,
                                       :name,
                                       :detail,
                                       :price_tax_excluded,
                                       :image,
                                       :selling_status
                                      )
    end

end
