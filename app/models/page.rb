class Page < ActiveRecord::Base

  validates :name, presence: true

  mount_uploader :banner, ImageUploader

  belongs_to :site

  before_save :check_menu_item
  before_save :assign_url

  extend FriendlyId
  friendly_id :url_alias

  scope :global, -> { where(global: true) }
  scope :side_pages, -> { where(side: true) }
  scope :main_pages, -> { where(side: nil) }


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

  def assign_url
    self.url_alias = self.name.parameterize
  end

end
