class AddIsActiveToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :datetime, :string
    add_index :end_users, :datetime
  end
end
