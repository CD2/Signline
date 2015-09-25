class ProductImport < ActiveRecord::Base
  attr_accessor :validating_field

  mount_uploader :file, ProductImporterUploader
  validates :file, presence: true
end
