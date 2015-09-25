class Address < ActiveRecord::Base
  attr_accessor :use_saved_address
  belongs_to :user
  validates :address_one, presence: true, unless: -> { "use_saved_address" == '1' }

end
