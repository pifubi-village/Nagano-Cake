class AddFirstNameToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :first_name, :string
    add_column :end_users, :first_name_kana, :string
    add_column :end_users, :family_name_kana, :string
    add_column :end_users, :phone_number, :string
    add_column :end_users, :post_code, :string
    add_column :end_users, :address, :string
  end
end
