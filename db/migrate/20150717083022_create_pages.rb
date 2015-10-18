class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :image
      t.text :body
      t.string :page_title
      t.string :url_alias
      t.text :meta_description
      t.boolean :published

      t.timestamps null: false
    end
  end
end
