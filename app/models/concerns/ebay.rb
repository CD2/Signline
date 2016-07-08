module Ebay
  require 'ebay_trader'
  require 'ebay_trader/request'
  begin
    EbayTrader.configure do |config|

      config.ebay_api_version = 935

      # Environment can be :sandbox or :production
      #if Rails.env.development?
      #  config.environment = :sandbox
      #else
      #  config.environment = :production
      #end
      config.environment = :production

      # Optional as ebay_site_id can also be specified for each request.
      # 0 for ebay.com [Default]
      # 3 for ebay.co.uk
      config.ebay_site_id = 3

      # If you are getting error messages regarding SSL Certificates
      # you can [temporarily] disable SSL verification.
      # Caution! setting this to false will make you vulnerable to man-in-the-middle attacks.
      # The default value is true
      config.ssl_verify = false  # because I like to live dangerously

      # Optional as auth_token can also be specified for each request.
      config.auth_token = Setting.first.auth_token

      config.dev_id  = Setting.first.dev_id
      config.app_id  = Setting.first.app_id
      config.cert_id = Setting.first.cert_id

      config.ru_name = Setting.first.ru_name

      # By default price values are represented as BigDecimal
      # This can be changed to any of the following
      #   :big_decimal, :fixnum, :integer, :float or :money
      # :money can only be specified if the Money gem is available to your application.
      config.price_type = :big_decimal
    end
  rescue Exception

  end
end