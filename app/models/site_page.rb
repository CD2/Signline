class SitePage < ActiveRecord::Base
  belongs_to :page
  belongs_to :site
end
