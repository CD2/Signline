class SiteCategory < ActiveRecord::Base

  belongs_to :site 
  belongs_to :category

end
