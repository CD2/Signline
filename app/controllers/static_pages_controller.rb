class StaticPagesController < ApplicationController
  def home
    @products = current_site.products.limit(24)
  end
end
