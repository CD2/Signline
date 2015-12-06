class Admin::PagesController < AdminController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :set_site

  # GET /pages
  def index
    @site = Site.find(params[:site_id])
    @pages = @site.pages 
    @pages << Page.where(site_id: nil)
  end

  # GET /pages/1
  def show
  end

  def new 
    @page = Page.new 
  end

  def edit
  end

  # POST /pages
  def create
    @site = Site.find(params[:site_id])
    @page = @site.pages.new(page_params)
    if @page.save
      process_menu_items
      redirect_to @page
      flash[:notice] = 'Page was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      process_menu_items
      redirect_to @page
      flash[:notice] = 'Page was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    redirect_to admin_pages_path
    flash[:notice] = 'Page was successfully destroyed.'
  end

  private

    def process_menu_items
      process_menu_item :main_menu, 1
      process_menu_item :side_menu, 2
    end

    def process_menu_item menu, item_type
      logger.debug params[:page][menu]
      if params[:page][menu] == "0"
        @page.menu_items.find_by(menu_type: item_type).try(:destroy)
      else
        if @menu_item = @page.menu_items.find_by(menu_type: item_type)
          @menu_item.update(name: @page.name, page_id: @page.id, menu_type: item_type, site_id: @page.site.id)
        else
          MenuItem.create!(name: @page.name, page_id: @page.id, menu_type: item_type, site_id: @page.site.id)
        end
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.friendly.find(params[:id])
      @object = @page
    end

    def set_site
      @site = Site.find(params[:site_id])
    end

    # Only allow a trusted parameter "white list" through.
    def page_params
      params.require(:page).permit(:name, :body, :image, :page_title, :url_alias, :meta_description, :published, :site_id, :homepage_id, :side_menu, :main_menu)
    end
end
