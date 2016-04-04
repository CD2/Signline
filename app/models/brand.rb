class Brand < ActiveRecord::Base

  has_many :products
  has_many :site_categories
  has_many :sites, through: :site_categories

end
