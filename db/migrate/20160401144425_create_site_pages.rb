class CreateSitePages < ActiveRecord::Migration
  def change
    create_table :site_pages do |t|
      t.belongs_to :site, index: true, foreign_key: true
      t.belongs_to :page, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
