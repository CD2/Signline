class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id

      t.integer :quantity, default: 1

      #product info to copy on purchase
      t.string  :name
      t.decimal :unit_price, precision: 8, scale: 2
      t.decimal :unit_cost_price, precision: 8, scale: 2
      t.decimal :tax_rate, precision: 8, scale: 4


      t.timestamps null: false
    end
  end
end
