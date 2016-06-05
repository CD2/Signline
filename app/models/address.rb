class Address < ActiveRecord::Base

  belongs_to :user

  validates :name, :address_one, :city, :county, :postcode, presence: true

  def full_address
    [name, address_one, address_two, county, postcode, country].reject(&:blank?).join('<br>')
  end
  
  
end
