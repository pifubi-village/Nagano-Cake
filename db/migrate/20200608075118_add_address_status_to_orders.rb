class AddAddressStatusToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :address_status, :integer
  end
end
