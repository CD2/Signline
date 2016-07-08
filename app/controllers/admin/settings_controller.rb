class Admin::SettingsController < AdminController

  def index
    @setting = Setting.find(1)
  end

  def update
    @setting = Setting.find(1)
    if @setting.update(setting_params)
      redirect_to admin_settings_url
      flash[:notice] = 'Settings was successfully updated.'
    else
      render :index
    end
  end

  private

    def setting_params
      params.require(:setting).permit(:paypal_email_address, :postcode, :auth_token, :dev_id, :app_id, :cert_id, :ru_name, :merchant_id, :access_key, :secret_key)
    end

end
