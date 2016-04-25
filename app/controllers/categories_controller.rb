class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.friendly.find(params[:id])
    if params[:sort]
      sort_params = {
        'name_asc': 'name ASC', 'name_desc': 'name DESC',
        'date_asc': 'created_at ASC', 'date_desc': 'created_at DESC',
        'price_asc': 'unit_price ASC', 'price_desc': 'unit_price DESC'}
      @products_c = @category.products.ordered(sort_params[params[:sort].to_sym]).all
      @products = @products_c.paginate(:page => params[:page], :per_page => 24)
    else 
      @products = @category.products.paginate(:page => params[:page], :per_page => 24)
    end
  end

end
