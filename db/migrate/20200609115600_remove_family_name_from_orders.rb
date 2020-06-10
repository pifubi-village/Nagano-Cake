class RemoveFamilyNameFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :family_name, :string
  end
end
