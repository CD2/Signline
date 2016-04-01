class Site < ActiveRecord::Base

  has_many :menu_items
  has_many :site_categories
  has_many :categories, through: :site_categories
  has_many :products, through: :categories
  has_many :site_pages
  has_many :pages, through: :site_pages

end
