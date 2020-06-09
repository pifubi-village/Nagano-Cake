class AddPriceTaxExcludedToCartProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_products, :price_tax_excluded, :integer
  end
end
