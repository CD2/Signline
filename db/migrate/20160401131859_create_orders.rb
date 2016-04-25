class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to  :billing_address, index: true, foreign_key: true
      t.belongs_to  :shipping_address, index: true, foreign_key: true


      t.string   :status
      t.string   :payment_type
      t.string   :shipping_type
      t.string   :name
      t.string   :email
      t.string   :ip
      t.string   :express_token
      t.string   :express_payer_id
      t.decimal  :amount, precision: 8, scale: 2


      t.datetime :purchased_at
      t.datetime :shipped_at

      t.timestamps null: false
    end
  end
end
