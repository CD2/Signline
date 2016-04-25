class SiteBrand < ActiveRecord::Base
  belongs_to :site
  belongs_to :brand
end
