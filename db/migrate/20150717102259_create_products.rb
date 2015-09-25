class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.text :body
      t.text :features
      t.integer :brand_id
      t.string :mpn
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
