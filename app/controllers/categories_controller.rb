class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    if params[:sort]
      @products = @category.products.order(params[:sort]).all
    else 
      @products = @category.products
    end
  end

end
