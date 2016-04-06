class Address < ActiveRecord::Base

  belongs_to :user

  validates :name, :address_one, :city, :county, :postcode, presence: true
  
  
end
