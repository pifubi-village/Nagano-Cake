class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.integer :price_tax_excluded
      t.text :detail
      t.string :image_id
      t.integer :selling_status
  

      t.timestamps
    end
  end
end
