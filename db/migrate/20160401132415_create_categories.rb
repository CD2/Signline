class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|

      t.string :name
      t.string :url_alias
      t.integer :parent
      
      t.timestamps null: false
    end
  end
end
