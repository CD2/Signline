class Product < ActiveRecord::Base
  attr_accessor :images

  validates :price, :name, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: true

  has_many :categorisations, dependent: :destroy
  has_many :categories, through: :categorisations
  has_many :product_images

  has_many :cart_items
  before_destroy :ensure_not_referenced_by_any_cart_item

  belongs_to :brand

  def categorised? category
    categories.include? category
  end

  def categorise category
    categorisations.create(category_id: category.id) unless categorisations.find_by(product_id: self.id, category_id: category.id)
  end

  def uncategorise category
    categorisations.find_by(category_id: category.id).destroy
  end

  def self.latest
    Product.order(:updated_at).last 
  end

  def ensure_not_referenced_by_any_cart_item
    if cart_items.empty?
      return true
    else
      errors.add(:base, 'Cart Items present')
      return false
    end
  end

end
