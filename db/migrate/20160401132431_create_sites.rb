class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      #details
      t.string :name
      t.string :subdomain

      #content
      t.string :logo
      t.string :color

      #control
      t.boolean :active, default: true
      t.boolean :default, default: false

      t.timestamps null: false
    end
  end
end
