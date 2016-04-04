class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.belongs_to :order, index: true, foreign_key: true
      t.belongs_to :product, index: true, foreign_key: true

      t.integer :quantity, default: 1
      t.decimal :unit_price, precision: 8, scale: 2
      t.decimal :unit_cost_price, precision: 8, scale: 2
      t.decimal :tax_rate, precision: 8, scale: 4


      t.timestamps null: false
    end
  end
end
