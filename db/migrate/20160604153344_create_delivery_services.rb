class CreateDeliveryServices < ActiveRecord::Migration
  def change
    create_table :delivery_services do |t|
      t.string :name
      t.string :code
      t.decimal :price,            precision: 8, scale: 2
      t.decimal :cost_price,       precision: 8, scale: 2
      t.boolean :default
      t.boolean :active
      t.string :courier
      t.string :tracking_url

      t.timestamps null: false
    end
  end
end
