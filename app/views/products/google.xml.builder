
xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom", "xmlns:g" => "http://base.google.com/ns/1.0" do
  xml.title
  xml.author do 
    xml.name "Winchmax"
  end 
  @products.each do |product|
    xml.entry do 
      xml.title product.name
      xml.link product_url(product)
      xml.description product.body
      xml.tag! "g:id", product.sku
      xml.tag! "g:google_product_category", "google > product > category"
      xml.tag! "g:product_type", product.categories.first.try(:name)
      xml.tag! "g:image_link", product.product_images.first.try(:image)
      xml.tag! "g:price", product.price 
      xml.tag! "g:mpn", product.sku
      xml.tag! "g:brand", product.brand
      xml.tag! "g:condition", "new"
      xml.tag! "g:availability", "in stock"
      xml.tag! "g:shipping" do 
        xml.tag! "g:country", "UK"
        xml.tag! "g:price", "0"
      end
    end
  end
end