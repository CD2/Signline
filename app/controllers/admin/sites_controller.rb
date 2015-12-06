class Admin::SitesController < AdminController
  before_action :set_site, only: [:edit, :update, :destroy]
  before_action :set_new, only: :new

  # GET /sites
  def index
    @sites = Site.all
  end

  # POST /sites
  def create
    @object = Site.new(site_params)

    if @object.save
      assign_urls
      @main_menu = Menu.create(name: "#{@object.name} Main Menu", machine_name: "#{@object.machine_name}_main_menu")
      @side_menu = Menu.create(name: "#{@object.name} Side Menu", machine_name: "#{@object.machine_name}_side_menu")
      @object.update_attributes(main_menu_id: @main_menu.id, side_menu_id: @side_menu.id)
      redirect_to admin_sites_path
      flash[:notice] = 'Site was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sites/1
  def update
    if @object.update(site_params)
      assign_urls
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

  def toggle_status
    @site = Site.find(params[:site_id])
    @site.active ? @site.suspend : @site.go_live
    redirect_to admin_sites_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
      @object = @site
    end

    def set_new
      @object = Site.new
    end

    def assign_urls
      unless params[:urls] == @object.urls.map { |site| site.url }.join(",")
        @object.urls.destroy_all
        if params[:urls]
          params[:urls].split(",").each do |url|
            siteurl = Url.create(url: url, site_id: @object.id)  
          end
        end
      end
    end

    # Only allow a trusted parameter "white list" through.
    def site_params
      params.require(:site).permit(:name, :machine_name, :url, :color, :logo, :second_sidebar, :second_sidebar_option, :home_body, :banner_image, :include_products)
    end
end
