class Setting < ActiveRecord::Base
  # The "singleton_guard" column is a unique column which must always be set to '0'
  # This ensures that only one AppSettings row is created
  validates_inclusion_of :singleton_guard, :in => [0]

  validates :paypal_email_address, :postcode, :auth_token, :dev_id, :app_id, :cert_id, :ru_name, :merchant_id, :access_key, :secret_key, presence: true

  def self.paypal_email
    first.paypal_email_address
  end

  def self.postcode
    first.postcode
  end

end
