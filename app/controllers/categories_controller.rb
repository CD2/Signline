class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.friendly.find(params[:id])
    if params[:sort]
      @products_c = @category.products.order(params[:sort]).all
      @products = @products_c.paginate(:page => params[:page], :per_page => 24)
    else 
      @products_c = @category.products
      @products = @products_c.paginate(:page => params[:page], :per_page => 24)
    end
  end

end
