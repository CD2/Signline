class Site < ActiveRecord::Base
  attr_accessor :second_sidebar_option
  before_validation :check_second_sidebar
  validates :machine_name, presence: true, uniqueness: true
  has_many :urls
  has_many :categories
  has_many :site_pages
  has_many :pages, through: :site_pages
  mount_uploader :logo, ImageUploader
  has_many :products, through: :categories
  has_many :menu_items
  has_many :site_categories
  has_many :categories, through: :site_categories

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

end
