class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity, default: 1

      t.timestamps null: false
    end
  end
end
