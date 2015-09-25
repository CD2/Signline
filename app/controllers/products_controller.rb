class ProductsController < ApplicationController
  
  def show
    @product = Product.find(params[:id])
    @features = @product.features.split("///")
  end

  def amazon
    @products = Product.all
  end

  def ebay
    @products = Product.all
  end

  def google
    @products = Product.all
  end

end
