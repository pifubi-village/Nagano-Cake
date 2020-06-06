class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
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
    redirect_to admin_products_path(@product.id)

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
