class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :path
      t.integer :menu_type
      t.integer :site_id
      t.integer :page_id

      t.timestamps null: false
    end
  end
end
