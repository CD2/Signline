xml.instruct!
xml.AddItemRequest "xmlns" => "urn:ebay:apis:eBLBaseComponents" do 
  xml.RequesterCredentials do 
    xml.eBayAuthToken "ABC123"
  end
  @products.each do |product|
    xml.Item do 
      xml.StartPrice product.price
      xml.ConditionID "1000"
      xml.Country "UK"
      xml.Currency "GBP"
      xml.DispatchTimeMax "3"
      xml.ListingDuration "Years_1"
      xml.ListingType "FixedPriceItem"
      xml.PaymentMethods "PayPal"
      xml.PayPalEmailAddress "something@test.com"
      xml.PostalCode "NR2 2BB"
      xml.ProductListingDetails do
        xml.UPC "sample"
        xml.IncludePrefilledItemInformation "true"
        xml.IncludeStockPhotoURL "true"
      end
      xml.Quantity "1"
      xml.ReturnPolicy do 
        xml.ReturnsAcceptedOption "ReturnsAccepted"
        xml.RefundOption "MoneyBack"
        xml.ReturnsWithinOption "Days_30"
        xml.Description "If not satisfied, return the item for refund."
      end
      xml.ShippingDetails do 
        xml.ShippingServiceOptions do 
          xml.ShippingServicePriority "1"
          xml.ShippingService "UPSGround"
          xml.ShippingServiceCost "0.00"
          xml.ShippingServiceAdditionalCost "0.00"
        end
      end
      xml.Title product.name
      xml.Description product.body
    end
  end
end