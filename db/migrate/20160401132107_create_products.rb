class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.integer :brand_id

      t.string   :name
      t.string   :machine_name
      
      t.string   :sku
      t.text     :body
      t.text     :features
      t.string   :mpn

      t.decimal :unit_price, precision: 8, scale: 2
      t.decimal :unit_cost_price, precision: 8, scale: 2
      t.decimal :tax_rate, precision: 8, scale: 4

      t.decimal :delivery, precision: 8, scale: 2

      #stocked, deleted....
      t.integer :status

      t.timestamps null: false
    end
  end
end
