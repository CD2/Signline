class Admin::CategoriesController < AdminController
  before_action :set_category, only: [:edit, :update, :destroy]
  before_action :set_new, only: :new

  # GET /categories
  def index
    @site = Site.find(params[:site_id])
    @categories = @site.categories
  rescue ActiveRecord::RecordNotFound
    @categories = Category.all
  end

  # POST /categories
  def create
    @object = Category.new(category_params)

    if @object.save
      categorise_sites
      redirect_to admin_categories_url
      flash[:notice] = 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      categorise_sites
      redirect_to admin_categories_url
      flash[:notice] = 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to admin_categories_url
    flash[:notice] = 'Category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.friendly.find(params[:id])
      @object = @category
    end

    def categorise_sites
      if params[:sited_ids]
        params[:sited_ids].each do |site_id|
          @object.assign_to_site Site.find(site_id) unless @object.assigned_to_site? Site.find(site_id)
        end
      end
    end

    def set_new
      @object = Category.new
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name, :machine_name, :site_ids => [])
    end
end
