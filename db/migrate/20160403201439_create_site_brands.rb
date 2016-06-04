class CreateSiteBrands < ActiveRecord::Migration
  def change
    create_table :site_brands do |t|
      t.integer :site_id
      t.integer :brand_id

      t.timestamps null: false
    end
  end
end
