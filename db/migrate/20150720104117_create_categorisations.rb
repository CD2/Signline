class CreateCategorisations < ActiveRecord::Migration
  def change
    create_table :categorisations do |t|
      t.integer :category_id
      t.integer :product_id

      t.timestamps null: false
    end
    add_index :categorisations, :category_id
    add_index :categorisations, :product_id
    add_index :categorisations, [:category_id, :product_id], unique: true
  end
end
