task import_celtrade: :environment do
  
  products_xml = File.open(Rails.root + "importers/celtrade.xml")
  products_raw = Nokogiri::XML products_xml
  products = products_raw.css('product')

  sku_next = 1

  products.to_enum.with_index.reverse_each do |product_xml, i|
    puts i
    title = product_xml.css('title').text
    product = Product.find_or_initialize_by(name: title)

    category = product_xml.css('category').text
    product.categories << Category.find_or_create_by(name: category)
    
    product.body = product_xml.css('product_body').text

    brand_name = product_xml.css('brand').text
    brand = Brand.find_or_create_by(name: brand_name)
    
    product.brand = brand

    product.unit_price = product_xml.css('price').text

    product_xml.css('images').children.each do |image|
      image_url = image.text
      begin
        product_image = ProductImage.new
        product_image.remote_image_url = image_url
        product_image.save!

        product.product_images << product_image
      rescue ActiveRecord::RecordInvalid
      end
    end

    product.sku = "celtrade-#{sku_next}"
    sku_next += 1
    product.save!

  end
end