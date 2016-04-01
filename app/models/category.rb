class Category < ActiveRecord::Base

  has_many :menu_items, as: :menu_item
  has_many :categorisations
  has_many :site_categories

  has_many :sites, through: :site_categories
  has_many :products, through: :categorisations

end
