class Page < ActiveRecord::Base
  before_save :assign_url

  mount_uploader :image, ImageUploader

  attr_accessor :homepage_id
  attr_accessor :side_menu
  attr_accessor :main_menu

  belongs_to :site
  has_many :menu_items
  
  extend FriendlyId
  friendly_id :url_alias

  def assigned_to_site? site
    pages.include? site
  end

  def assign_to_site site
    site_pages.create(site_id: site.id)
  end

  def unassign_from_site site
    site_pages.find_by(site_id: site.id).destroy
  end

  def assign_url
    self.url_alias = self.name.parameterize
  end

end
