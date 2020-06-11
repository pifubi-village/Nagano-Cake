class Order < ApplicationRecord
	validates :name,presence: true
    validates :post_code,  presence: true

	belongs_to :end_user

	has_many :order_products, dependent: :destroy

	enum payment_method:{
		cash: 0,
		credit_card: 1
	}

	enum oeder_status:{
		入金待ち: 0,
		入金確定: 1,
		制作中自動更新: 2,
		発送準備中: 3,
		発送済み: 4
	}
end
