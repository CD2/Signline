class Site < ActiveRecord::Base

  mount_uploader :logo, ImageUploader

  has_many :menu_items
  has_many :menu_pages, source: :page, through: :site_pages 

  has_many :site_pages
  has_many :pages, through: :site_pages

  has_many :site_categories
  has_many :categories, through: :site_categories
  has_many :products, through: :categories

  has_many :site_brands
  has_many :brands, through: :site_brands


  scope :active, -> { where(active: true)}

  validates :subdomain, presence: true, if: :active?

  def menu_pages
    pages = super
    pages << Page.global
  end

  def pages
    pages = super
    pages << Page.global
  end

  def self.default
    find_by(default: true)
  end

  def activate!
    self.active = true
    save!
  end

  def deactivate!
    self.active = false
    save!
  end

end
