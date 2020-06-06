class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  end

  

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if  @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
    def product_params
      params.require(:product).permit(:genre_id,
                                       :name,
                                       :detail,
                                       :price_tax_excluded,
                                       :image_id,
                                       :selling_status
                                      )
    end

end
