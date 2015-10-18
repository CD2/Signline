class Page < ActiveRecord::Base

  before_save :assign_url

  mount_uploader :image, ImageUploader

  attr_accessor :site_id
  attr_accessor :homepage_id
  attr_accessor :include_in_side_menu
  attr_accessor :include_in_main_menu

  #before_save :evaluate_menu_links

  has_many :site_pages, dependent: :destroy
  has_many :sites, through: :site_pages
  has_many :menu_items
  accepts_nested_attributes_for :menu_items

  def assigned_to_site? site
    pages.include? site
  end

  def assign_to_site site
    site_pages.create(site_id: site.id)
  end

  def unassign_from_site site
    site_pages.find_by(site_id: site.id).destroy
  end

  def clean_title
    start = self.name.downcase
    clean_title = ""
    valid = /[a-z]/
    start.each_char do |x|
      if x == " "
        clean_title += "-"
      elsif valid.match(x)
        clean_title += x
      end
    end
    return clean_title
  end

  def assign_url
    self.url_alias = clean_title
  end

  #def evaluate_menu_links
  #  if self.include_in_side_menu == "0"
  #    self.side_menu_label == nil
  #    MenuItem.where()
  #  else
  #    create_side_menu_items
  #  end
  #  if self.include_in_main_menu == "0"
  #    self.main_menu_label == nil
  #    destroy_main_menu_items
  #  else
  #    create_menu_menu_items
  #  end
  #end
end
