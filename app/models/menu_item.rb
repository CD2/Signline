class MenuItem < ActiveRecord::Base

  belongs_to :site
  belongs_to :page

  validates :name, presence: true
  validates :path, presence: true, unless: "path.nil?"


end
