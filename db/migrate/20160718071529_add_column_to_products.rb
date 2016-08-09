class AddColumnToProducts < ActiveRecord::Migration
  def change

    add_column :products, :amazon_asin, :string

  end
end
