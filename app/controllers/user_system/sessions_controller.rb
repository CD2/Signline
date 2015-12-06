class UserSystem::SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        log_in user
        set_admin_active
        remember(user)
        redirect_to root_url
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if signed_in?
    redirect_to root_url
  end

  def admin_visible_toggle
    respond_to do |format|
      format.js do 
        if session[:admin_visible]
          session.delete(:admin_visible)
        else 
          session[:admin_visible] = true
        end
      end
    end
    render nothing: true
  end

  def get_user_id
    render json: current_user
  end

  private 

    def set_admin_active
      if signed_in_as_admin?
        session[:admin_visible] = true
      end
    end
  
end
