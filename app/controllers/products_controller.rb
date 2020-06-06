class ProductsController < ApplicationController

  def index
  	@products = Product.all
  end

  def show
  	@products = Product.find(paramas[:id])
  end
end
