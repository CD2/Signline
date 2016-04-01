class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|

      t.belongs_to :site
      t.belongs_to :menu_item, polymorphic: true

      t.timestamps null: false
    end
  end
end
