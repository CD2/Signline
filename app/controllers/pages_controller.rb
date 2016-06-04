class PagesController < ApplicationController

  def show
    @page = @site.pages.friendly.find(params[:id] || 'home-page')
  end

end