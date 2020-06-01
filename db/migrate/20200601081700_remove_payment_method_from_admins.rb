class RemovePaymentMethodFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :payment_method, :enum
  end
end
