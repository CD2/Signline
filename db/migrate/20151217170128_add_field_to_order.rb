class AddFieldToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :purchased_at, :datetime
    add_column :orders, :amount, :decimal
  end
end
