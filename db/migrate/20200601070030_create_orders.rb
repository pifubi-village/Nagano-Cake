class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :postage
      t.integer :amount_price
      t.integer :oeder_status
      t.string :address
      t.stirng :name
      t.string :post_code

      t.timestamps
    end
  end
end
