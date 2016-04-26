class Page < ActiveRecord::Base

  mount_uploader :banner, ImageUploader

  belongs_to :site

  before_save :check_menu_item


  extend FriendlyId
  friendly_id :url_alias

  scope :global, -> { where(global: true) }


  def menu_item=(val)
    @menu_item = val
  end

  def menu_item?
    @menu_item || false
  end

  private

  def check_menu_item
    unless menu_item?
      menu_item_name = nil
    end
  end

end
