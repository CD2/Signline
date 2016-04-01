class Product < ActiveRecord::Base

  has_many :cart_items
  has_many :product_images
  belongs_to :brand
  has_many :menu_items, as: :menu_item
  has_many :categorisations
  has_many :categories, through: :categorisations
  has_many :sites, through: :categories
  
end
