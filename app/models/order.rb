class Order < ApplicationRecord

	belongs_to :end_user

	has_many :order_products, dependent: :destroy

	enum peyment_method:{
		cash: 0,
		credit_card: 1
	}

	enum order_status:{
		入金待ち: 0,
		入金確定: 1,
		制作中自動更新: 2,
		発送準備中: 3,
		発送済み: 4
	}
	enum address_status:{
		ご自身の住所: 0,
		登録済み住所: 1,
		新しいお届け先: 2

	}
end
