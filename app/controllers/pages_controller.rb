class PagesController < ApplicationController
  
  def show
    @page = Page.friendly.find(params[:id])
  end

  def terms_and_conditions

  end

  def privacy_policy

  end

end
