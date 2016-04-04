class Product < ActiveRecord::Base

  has_many :cart_items
  has_many :product_images
  belongs_to :brand
  has_many :categorisations
  has_many :categories, through: :categorisations
  has_many :sites, through: :categories
  
  scope :ordered, lambda {|*args| order(args.first || 'created_at DESC') }

  def primary_image
    product_images.first
  end

end
