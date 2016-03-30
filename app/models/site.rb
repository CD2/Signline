class Site < ActiveRecord::Base
  attr_accessor :second_sidebar_option
  before_validation :check_second_sidebar
  validates :machine_name, presence: true, uniqueness: true
  has_many :urls
  has_many :categories
  has_many :pages
  mount_uploader :logo, ImageUploader
  has_many :products, through: :categories
  has_many :menu_items
  has_many :site_categories
  has_many :categories, through: :site_categories
  has_many :brands, through: :products

  scope :active, -> { where("active='t' AND url NOT NULL") }

  mount_uploader :banner_image, ImageUploader
  def go_live
    self.active = true
    self.save
  end

  def suspend
    self.active = false
    self.save
  end

  def check_second_sidebar
    if self.second_sidebar_option == "0"
      self.second_sidebar = nil
    end
  end

  def main_url
    @url = self.urls.first.url
  end

  def main_menu_items
    @menu_items = self.menu_items.where(menu_type: 1)
  end

  def side_menu_items
    @menu_items = self.menu_items.where(menu_type: 2)
  end

  def self.default
    find_by(default_site: true)
  end

end
