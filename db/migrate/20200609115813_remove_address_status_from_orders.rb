class RemoveAddressStatusFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :address_status, :integer
  end
end
