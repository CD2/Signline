class ProductsController < ApplicationController
  
  def show
    @product = Product.find(params[:id])
    @images = @product.product_images
    @features = @product.features.split("///")
  end

  def index
    @search = params[:search]
    @products = Product.where("name like ?", "%#{@search}%")
  end

end
