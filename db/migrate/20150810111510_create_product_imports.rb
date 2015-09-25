class CreateProductImports < ActiveRecord::Migration
  def change
    create_table :product_imports do |t|
      t.string :file

      t.timestamps null: false
    end
  end
end
