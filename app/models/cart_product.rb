class CartProduct < ApplicationRecord

	belongs_to :end_user
	belongs_to :product
end
