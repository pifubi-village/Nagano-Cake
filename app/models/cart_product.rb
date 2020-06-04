class CartProduct < ApplicationRecord

	belongs_to :end_user
	belongs_to :product

	array = []
	Product.all.each do |product|
		array << product.price
	end
	array.sum



end
