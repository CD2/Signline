class AdminController < ApplicationController
  include Permissions
  before_action :require_admin
  before_action :define_site
  layout 'admin_application'

  def new
    render "admin/new"
  end

  def edit
    render "admin/edit"
  end

  def define_site
    if params[:site_id]
      @nav_site = Site.find(params[:site_id])
    else 
      @nav_site = Site.find(params[:id])
    end
  rescue ActiveRecord::RecordNotFound
    @nav_site = current_site
  end

end
