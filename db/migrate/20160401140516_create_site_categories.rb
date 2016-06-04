class CreateSiteCategories < ActiveRecord::Migration
  def change
    create_table :site_categories do |t|
      t.integer :site_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
