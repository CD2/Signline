class Site < ActiveRecord::Base

  mount_uploader :logo, ImageUploader

  has_many :pages, dependent: :destroy

  has_many :site_categories
  has_many :categories, through: :site_categories
  has_many :products, through: :categories

    belongs_to :category

  has_many :site_brands
  has_many :brands, through: :site_brands


  scope :active, -> { where(active: true)}
  scope :default, -> { find_by(default: true) }


  validates :subdomain, presence: true, if: :active?

  def pages
    Page.where(id: super.ids + Page.global.ids)
  end

  def _pages
    method(:pages).super_method.call
  end

  def find_page url
    _pages.find_by(url_alias: url) || Page.global.find_by(url_alias: url)
  end

  def build_page *args, &block
    _pages.build *args, &block
  end
  def add_page *args, &block
    _pages.create *args, &block
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
