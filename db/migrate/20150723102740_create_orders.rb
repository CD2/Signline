class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :billing_address_id
      t.integer :shipping_address_id
      t.string :status
      t.string :payment_type
      t.string :shipping_type

      t.timestamps null: false
    end
  end
end
