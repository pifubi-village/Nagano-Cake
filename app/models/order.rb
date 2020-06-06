class Order < ApplicationRecord

	belongs_to :end_user

	has_many :order_products, dependent: :destroy
	
	enum peyment_method:{
		cash: 0,
		credit_card: 1
	}

	enum order_status:{
		waiting: 0,
		paid: 1,
		preparing: 2,
		derivering: 3,
		derivered: 4
	}

	Order.order_products.all.sum(:price_tax_included)
end
