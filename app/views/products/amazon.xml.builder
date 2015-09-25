xml.instruct!
xml.AmazonEnvelope "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xsi:noNamespaceSchemaLocation" => "amzn-envelope.xsd" do
  xml.Header do 
    xml.DocumentVersion "1.01"
    xml.MerchantIdentifier "xxxxx"
  end
  xml.MessageType "Product"
  xml.PurgeAndReplace "false"
  @products.each do |product|
    xml.Message do
      xml.MessageID product.id
      xml.OperationType "Update"
      xml.Products do
        xml.SKU product.sku
        xml.ProductTaxCode "G_GEN_TAX"
        xml.DescriptionData do
          xml.Title product.name
          xml.Brand product.brand.try(:name)
          xml.Description product.body
          if product.features
            product.features.split("///").each do |feature|
              xml.BulletPoint feature
            end
          end
          xml.MSRP "currency" => "GBP" do 
            xml.price (product.price + 10)
          end
          xml.Manufacturer product.brand.try(:name)
          xml.ItemType product.categories.first.try(:name)
        end
      end
    end
  end
    
end