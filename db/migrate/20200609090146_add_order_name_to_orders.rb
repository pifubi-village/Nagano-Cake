class AddOrderNameToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :family_name, :string
    add_column :orders, :first_name, :string
  end
end
