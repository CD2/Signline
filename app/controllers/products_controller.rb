class ProductsController < ApplicationController

  def index
    @search = params[:search]
    @products = Product.where("UPPER(NAME) like ?", "%#{@search.upcase}%")
  end
  
  def show
    @product = Product.friendly.find(params[:id])
  end

end
