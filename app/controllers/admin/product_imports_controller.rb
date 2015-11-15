class Admin::ProductImportsController < AdminController
  before_action :get_file, only: [:confirm_import, :process_import]

  def new
    @product_import = ProductImport.new
  end

  def create
    @product_import = ProductImport.new(product_import_params)
    if @product_import.save
      redirect_to admin_product_import_confirm_import_path @product_import
    else
      render :new
    end
  end

  def confirm_import
  end

  def process_import
    @file.css("products product").each do |product|
      brand_name = product.at_css("brand").try(:content)
      unless brand_name == nil
        unless @brand = Brand.find_by(name: brand_name) 
          @brand = Brand.create(name: brand_name)
        end
      end
      @brand == nil ? brand_id = nil : brand_id = @brand.id
      import_params = {
        name: product.at_css("title").content,
        brand_id: brand_id,
        price: product.at_css("price").try(:content).gsub('£', ''),
        body: "<p>#{product.at_css('product_body').content}</p>",
        features: product.at_css("feature").to_s.gsub('<feature>', '').gsub('</feature>', '///'),
        mpn: product.at_css("Manufacturer_Part_Number").try(:content)
      }
      category_name = product.at_css("category").content.to_s.gsub("&amp;", "&")
      unless @category = Category.find_by(name: category_name)
        @category = Category.create(name: category_name, machine_name: category_name.parameterize)
      end
      if @product = Product.find_by(name: import_params[:name])
        @product.update(import_params)
      else
        @product = Product.new(import_params)
      end
      if @product.save
        @product.categorise @category
        product.css("images image").each { |image| @product.product_images.create(remote_image_url: image.content) }
      end
    end
    redirect_to admin_products_path
  end

  private

    def get_file
      @product_import = ProductImport.find(params[:product_import_id])
      filename ||= "#{Rails.root}/public#{@product_import.file.url}"
      @file = Nokogiri::XML(File.open(filename))
    end

    def product_import_params
      params.require(:product_import).permit(:file)
    end
end
