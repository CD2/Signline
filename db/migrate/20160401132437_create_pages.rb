class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      
      t.string   :name
      t.string   :banner
      t.string   :banner_text
      t.text     :body
      t.string   :layout

      t.string  :menu_item_name
      t.boolean :side
      t.belongs_to :site

      #meta
      t.string   :page_title
      t.string   :url_alias
      t.text     :meta_description

      #control
      t.boolean  :published
      t.boolean  :global

      t.timestamps null: false
    end
  end
end
