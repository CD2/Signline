class ProductImage < ActiveRecord::Base
  attr_accessor :remote_image_url

  belongs_to :product

  mount_uploader :image, ProductImageUploader
end
