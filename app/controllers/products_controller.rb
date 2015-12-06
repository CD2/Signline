class ProductsController < ApplicationController
  
  def show
    @product = Product.find(params[:id])
    @images = @product.product_images
    @features = @product.features.split("///")
  end

  def index
    @search = Product.search do 
      fulltext params[:search]
    end
    @products = @search.results
  end

end
