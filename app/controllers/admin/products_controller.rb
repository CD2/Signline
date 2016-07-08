class Admin::ProductsController < AdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :ebay]
  before_action :set_features, only: :edit

  # GET /products

  def index
    @products = Product.paginate(:page => params[:page], :per_page => 50)
  end

  def new
    @product = Product.new
  end

  # GET /products/1
  def show
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      process_images
      redirect_to admin_products_path
      flash[:notice] = 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      process_images
      redirect_to admin_products_path
      flash[:notice] = 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to admin_products_path
    flash[:notice] = 'Product was successfully destroyed.'
  end

  def export
    @products = Product.all
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.store {
        xml.products {
          @products.each do |product|
            xml.product {
              xml.name product.name
              xml.price product.price
            }
          end
        }
      }
    end
    puts builder.to_xml
    render xml: builder
  end

  def remove_image
    @image = ProductImage.find(params[:product_image])
    @image.destroy
    render nothing: true
  end

  def ebay
    if @product.item_on_ebay?
      flash[:error] = "Item already on Ebay"
    else
      begin
        result = @product.add_item_to_ebay
        if result.success?
          flash[:success] = "Product listed on Ebay"
        else
          flash[:error] = result.response_hash[:errors].map { |e| e[:long_message] }.join(", ")
        end
        url_req = @product.get_item_info_from_sku
        if url_req.success?
          @product.update_attributes(ebay_item_id: url_req.response_hash["item"]["item_id"], ebay_url: url_req.response_hash["item"]["listing_details"]["view_item_url"])
          flash[:success] = "Product listed on Ebay, item_id: #{result.response_hash['item_id']}"
        end
      rescue EbayTrader::EbayTraderTimeoutError
        flash[:error] = "Ebay failed to respond within 30 seconds"
      end
    end
    redirect_to admin_products_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
      @object = @product
    end

    def set_new
      @object = Product.new 
    end

    def set_features
      @features =  @object.features.split("///") if @object.features
      @images = @object.product_images
    end

    def process_features
      if params[:features]
        @features = ""
        params[:features].each_with_index { |feature, i| @features += "#{feature}///" }
        @object.update(features: @features)
      end
    end

    def process_images
      if params[:images]
        params[:images]['image'].each do |image|
          @image = @object.product_images.create(image: image, product_id: @object.id)
        end
      end
    end

    def categorise_products
      if params[:categories]
        params[:categories][:category].each do |category_id|
          category = Category.find(category_id)
          unless @object.categorised? category
            @object.categorise category
          end
        end
      end
    end





    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :body, :sku, :price, :brand_id, :images, :ebay_category, :categories => [])
    end
end
