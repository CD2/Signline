class Admin::PagesController < AdminController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :set_site
  before_action :set_new, only: :new

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
    @side_menu_item = @object.menu_items.build
  end

  def edit
    if @object.menu_item
      @side_menu_item = @object.menu_item
    else
      @object.menu_item.build
    end
    render 'edit'
  end

  # POST /pages
  def create
    @site = Site.find(params[:site_id])
    @object = @site.pages.new(page_params)
    if @object.save
      remove_menu_items
      redirect_to @object
      flash[:notice] = 'Page was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      remove_menu_items
      redirect_to admin_pages_path
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

    def remove_menu_items
      if params[:page][:include_in_side_menu] == "0"
        @object.menu_items.find_by(menu_type: 2).destroy
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.friendly.find(params[:id])
      @object = @page
    end

    def set_new
      @object = Page.new 
    end

    def set_site
      @site = Site.find(params[:site_id])
    end

    # Only allow a trusted parameter "white list" through.
    def page_params
      params.require(:page).permit(:name, :body, :image, :page_title, :url_alias, :meta_description, :published, :site_id, :homepage_id, :include_in_side_menu, menu_items_attributes: [:name, :menu_type, :site_id, :id])
    end
end
