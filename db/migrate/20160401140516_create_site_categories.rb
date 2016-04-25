class CreateSiteCategories < ActiveRecord::Migration
  def change
    create_table :site_categories do |t|
      t.belongs_to :site, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
