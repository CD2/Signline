class AdminController < ApplicationController
  include Permissions
  before_action :require_admin
  layout 'admin_application'

end
