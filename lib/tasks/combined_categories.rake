desc "Combine Categories"
task combine_brands: :environment do 

  Brand.all.each do |brand|
    if brand.products.count == 0
      brand.destroy
    end
    name = brand.name 
    id = brand.id
    brands = Brand.where(name: name)
    brands.each do |b|
      b.products.each do |product|
        product.update_attributes(brand_id: id)
      end
    end
    if brand.products.count == 0
      brand.destroy
    end
  end

end