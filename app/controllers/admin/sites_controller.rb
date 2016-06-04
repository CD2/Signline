class Admin::SitesController < AdminController
  before_action :set_site, only: [:edit, :update, :destroy]

  # GET /sites
  def index
    @sites = Site.all
  end

  # POST /sites
  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to admin_sites_path
      flash[:notice] = 'Site was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sites/1
  def update
    if @site.update(site_params)
      redirect_to admin_sites_path
      flash[:notice] = 'Site was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sites/1
  def destroy
    @site.destroy
    redirect_to admin_sites_path
    flash[:notice] = 'Site was successfully destroyed.'
  end



  private

    # Only allow a trusted parameter "white list" through.
    def site_params
      params.require(:site).permit(:name, :subdomain, :color, :logo)
    end
end
