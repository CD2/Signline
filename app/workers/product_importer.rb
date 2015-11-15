class ProductImporter
  @queue = :product_import
  def self.perform(import_id)
    @product_import = ProductImport.find(import_id)
    filename ||= "#{Rails.root}/public#{@product_import.file.url}"
    @file = Nokogiri::XML(File.open(filename))
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
      unless @product = Product.find_by(name: import_params[:name])
        @product = Product.new(import_params)
        if @product.save
          @product.categorise @category
          product.css("images image").each { |image| @product.product_images.create(remote_image_url: image.content) }
        end
      end
    end
  end
end 