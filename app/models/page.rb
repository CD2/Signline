class Page < ActiveRecord::Base

  mount_uploader :banner, ImageUploader

  has_one :menu_item
  has_many :site_pages
  has_many :sites, through: :site_pages

  after_save :check_menu_item

  attr_accessor :has_menu_item

  extend FriendlyId
  friendly_id :url_alias

  scope :global, -> { where(global: true) }

  def has_menu_item
    @has_menu_item ||= sites.map { |site| site.menu_items.find_by(page_id: id) }.any?
  end

  private

  def check_menu_item
    if has_menu_item
      sites.each { |site| site.menu_items.create!(page_id: id) }
    else
      sites.each { |site| site.menu_items.where(page_id: id).destroy_all }
    end
  end

end
