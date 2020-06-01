class Product < ApplicationRecord

	has_many :cart_products, dependent: :destroy
	has_many :order_products, dependent: :destroy

	belongs_to :genre
end
