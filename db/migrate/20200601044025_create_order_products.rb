class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :product_id
      t.integer :number
      t.integer :price_tax_included
      t.integer :production_status

      t.timestamps
    end
  end
end
