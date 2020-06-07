class AddDetailsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :product_id, :integer
  end
end
