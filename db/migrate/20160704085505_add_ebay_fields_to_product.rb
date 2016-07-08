class AddEbayFieldsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :ebay_item_id, :string
    add_column :products, :ebay_url, :string
    add_column :products, :ebay_category, :string
  end
end
