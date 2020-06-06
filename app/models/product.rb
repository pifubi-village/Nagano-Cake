class Product < ApplicationRecord

	has_many :cart_products, dependent: :destroy
	has_many :order_products, dependent: :destroy

	belongs_to :genre
	attachment :image

	enum selling_status: {
		販売中: 0,
		stopping: 1,
		finished: 2
	}
end
