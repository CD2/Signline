class Admin::CategoriesController < AdminController
  before_action :set_category, only: [:edit, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  # POST /categories
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_url
      flash[:notice] = 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
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

    def set_new
      @object = Category.new
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name, :parent_id)
    end
end
