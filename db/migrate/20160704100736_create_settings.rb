class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|

      #payment settings
      t.string :paypal_email_address
      t.string :postcode

      #ebay settings
      t.string :auth_token
      t.string :dev_id
      t.string :app_id
      t.string :cert_id
      t.string :ru_name

      #amazon settings
      t.string :merchant_id
      t.string :access_key
      t.string :secret_key
      t.string :amazon_auth_token

      #Protect against multiple settings records
      t.integer :singleton_guard, default: 0, uniq: true

      t.timestamps null: false
    end
  end
end
