class Admin::MenuItemsController < AdminController
  before_action :set_site
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

  def new
    @object = MenuItem.new
  end

  def edit
  end

  def create
    @object = MenuItem.new(menu_item_params)
    @object.site = @site
    if @object.save
      redirect_to admin_site_menu_items_path @site
      flash[:notice] = 'MenuItem was successfully created.'
    else
      render :new
    end
  end

  def update
    if @object.update(menu_item_params)
      if @object.menu_type == 1
        redirect_to admin_site_main_menu_path @object.site
      else
        redirect_to admin_site_side_menu_path @object.site
      end
      flash[:notice] = 'MenuItem was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @object.destroy
    redirect_to [:admin, @menu]
    flash[:notice] = 'MenuItem was successfully destroyed.'
  end

  def index
    @main_menu_items = @site.main_menu_items
    @side_menu_items = @site.side_menu_items
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
      @object = @menu_item
    end

    def set_site
      @site = Site.find(params[:site_id])
    end


    # Only allow a trusted parameter "white list" through.
    def menu_item_params
      params.require(:menu_item).permit(:name, :path, :page_id, :menu_type, :category_id)
    end
end
