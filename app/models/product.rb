class Product < ApplicationRecord

	has_many :cart_products, dependent: :destroy
	has_many :order_products, dependent: :destroy

	belongs_to :genre

	enum selling_status:{
		selling: 0,
		stopping: 1,
		finished: 2
	}
end
