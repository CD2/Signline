class Product < ActiveRecord::Base

  has_many :order_items
  has_many :product_images
  belongs_to :brand
  has_many :categorisations
  has_many :categories, through: :categorisations
  has_many :sites, through: :categories
  
  scope :ordered, lambda {|*args| order(args.first || 'created_at DESC') }

  extend FriendlyId
  friendly_id :machine_name

  validates :sku, presence: true, uniqueness: true

  before_save :set_machine_name

  def images
    product_images.collect { |product_image| product_image.image }
  end

  def primary_image
    images.first
  end

  def category= val
    categories << Category.find_by_path(val)
  end

  def images= val
    product_images << (val.map { |image| ProductImage.create(image: image) } )
  end

  def features= val
    super (val.kind_of? Array) ? val *"\n" : val
  end

  def features
    super.split("\n") if super
  end

  def category
    categories.first
  end

  private

  def set_machine_name
    self.machine_name = self.name.parameterize
  end

end
