class AddColumnToSettings < ActiveRecord::Migration
  def change

    add_column :settings, :amazon_auth_token, :string

  end
end
