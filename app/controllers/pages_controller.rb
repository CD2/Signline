class PagesController < ApplicationController

  def show
    @page = @site.pages.friendly.find(params[:id] || '')
    render @page.layout if @page && !@page.layout.blank?
  end

end