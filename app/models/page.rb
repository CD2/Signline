class Page < ActiveRecord::Base

  has_many :menu_items, as: :menu_item
  has_many :site_pages
  has_many :pages, through: :pages

end
