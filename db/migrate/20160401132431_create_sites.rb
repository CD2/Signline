class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      #details
      t.string :name
      t.string :machine_name
      t.string :email
      t.string :subdomain

      #content
      t.string :logo
      t.string :color
      t.text   :home_body
      t.string :banner_image
      t.text   :banner_text

      #control
      t.boolean :default_site
      t.boolean :active

      t.timestamps null: false
    end
  end
end
