class Admin::PagesController < AdminController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  def index
    @pages = Page.all
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
    @page = Page.new(page_params)
    if @page.save
      redirect_to admin_pages_url
      flash[:notice] = 'Page was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      redirect_to admin_pages_url
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

    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end


    # Only allow a trusted parameter "white list" through.
    def page_params
      params.require(:page).permit(:name, :body, :image, :page_title, :url_alias, :meta_description, :published, :site_id, :homepage_id, :side_menu, :main_menu)
    end
end
