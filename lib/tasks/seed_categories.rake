task gen_categories: :environment do
  
  @shop.categories.create!(name: 'Office')
  @shop.categories.create!(name: 'Workshop')
  @shop.categories.create!(name: 'Healthcare')
  @shop.categories.create!(name: 'Arts and Crafts')
  @shop.categories.create!(name: 'Signs and Printing')
  @shop.categories.create!(name: 'Promotional Products')
  @shop.categories.create!(name: 'Automotive and Marine')
  @shop.categories.create!(name: 'Electronics')
  @shop.categories.create!(name: 'Clothing, Workwear and PPE')
  @shop.categories.create!(name: 'Outdoor furniture and Garden')
  @shop.categories.create!(name: 'Animal Feeds and Supplies')
  @shop.categories.create!(name: 'Child')
  @shop.categories.create!(name: 'Household')

  # s = Category.first.children.create!(name: 'Stationary')
  # @s = s.children.create!(name: 'pens')



end