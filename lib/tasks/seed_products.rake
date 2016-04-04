task gen_products: :environment do 
  
  @shop.categories.first.products.create!(
    name: 'Product 1',
    sku: 'sku_prod_1',
    body: 'This is a really god product... at least for the first one',
    features: 'Feature 1\n2nd Feature\nA third?',
    mpn: 'mpn1',
    unit_price: 500.00,
    unit_cost_price: 50.00,
    tax_rate: 0.2,
    )  
  @shop.categories.first.products.create!(
    name: 'Product 2',
    sku: 'sku_prod_1',
    body: 'This is a really god product... at least for the first one',
    features: 'Feature 1\n2nd Feature\nA third?',
    mpn: 'mpn1',
    unit_price: 10.00,
    unit_cost_price: 50.00,
    tax_rate: 0.2,
    )  
  @shop.categories.first.products.create!(
    name: 'Product 3',
    sku: 'sku_prod_1',
    body: 'This is a really god product... at least for the first one',
    features: 'Feature 1\n2nd Feature\nA third?',
    mpn: 'mpn1',
    unit_price: 100.00,
    unit_cost_price: 50.00,
    tax_rate: 0.2,
    )  
  @shop.categories.first.products.create!(
    name: 'Product 4',
    sku: 'sku_prod_1',
    body: 'This is a really god product... at least for the first one',
    features: 'Feature 1\n2nd Feature\nA third?',
    mpn: 'mpn1',
    unit_price: 200.00,
    unit_cost_price: 50.00,
    tax_rate: 0.2,
    )

end
