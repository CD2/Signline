class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      
      t.belongs_to  :user, index: true, foreign_key: true
      t.belongs_to  :shipping_address, index: true, foreign_key: true
      t.belongs_to  :billing_address, index: true, foreign_key: true

      t.integer  :checkout_status, default: 0
      t.integer  :order_status
      t.integer  :payment_type
      t.integer  :shipping_type
      t.boolean  :same_shipping_address

      t.string   :name
      t.string   :email
      t.string   :phone

      t.string   :ip
      t.string   :express_token
      t.string   :express_payer_id
      t.decimal  :amount, precision: 8, scale: 2

      t.string :order_tracking_id

      t.datetime :purchased_at
      t.datetime :shipped_at

      t.timestamps null: false
    end
  end
end
