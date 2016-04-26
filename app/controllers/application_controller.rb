class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  include SessionsHelper

  protect_from_forgery with: :null_session
  before_action :set_current_site
  prepend_before_filter :redirect_to_default_subdomain

  private

    def redirect_to_default_subdomain
      if request.subdomain.empty?
        redirect_to subdomain: Site.default.subdomain
      end
    end

    def set_current_site
      @site = Site.find_by(subdomain: request.subdomain)
    end
end
