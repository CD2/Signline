class CreateSiteBrands < ActiveRecord::Migration
  def change
    create_table :site_brands do |t|
      t.belongs_to :site, index: true, foreign_key: true
      t.belongs_to :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
