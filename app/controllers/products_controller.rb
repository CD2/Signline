class ProductsController < ApplicationController
  
  def show
    @product = Product.find(params[:id])
    @features = @product.features.split("///")
  end

end
