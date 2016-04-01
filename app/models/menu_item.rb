class MenuItem < ActiveRecord::Base

  belongs_to :site
  belongs_to :menu_item, polymorphic: true

end
