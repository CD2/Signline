class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :email
      t.string :machine_name
      t.string :color
      t.string :logo
      t.text :home_body
      t.string :banner_image
      t.boolean :include_products
      t.boolean :default_site, default: false
      t.boolean :active, default: false
      t.text :second_sidebar
      t.integer :homepage_id
      t.integer :include_cart

      t.timestamps null: false
    end
  end
end
