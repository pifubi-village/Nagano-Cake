class AddFamilyNameToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :family_name, :string
  end
end
