module Permissions

  def require_logged_in
    unless signed_in?
      flash[:notice] = "Please sign in"
      redirect_to login_url
    end
  end

  def require_admin
    unless signed_in_as_admin?
      flash[:notice] = "Please sign in"
      redirect_to login_url
    end
  end

end