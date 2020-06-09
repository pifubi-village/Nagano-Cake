class AddPostageToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :postage, :integer, default:'800'
  end
end
