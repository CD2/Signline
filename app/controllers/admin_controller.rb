class AdminController < ApplicationController
  include Permissions
  before_action :require_admin

  def new
    render "admin/new"
  end

  def edit
    render "admin/edit"
  end

end
