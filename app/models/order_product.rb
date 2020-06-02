class OrderProduct < ApplicationRecord

	belongs_to :order
	belongs_to :product

	enum production_status:{
		not_available: 0,
		waiting: 1,
		preparing: 2,
		completed: 3
	}
end
