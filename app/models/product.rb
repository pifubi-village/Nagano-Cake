class Product < ApplicationRecord

	has_many :cart_products, dependent: :destroy
	has_many :order_products, dependent: :destroy
	has_many :favorites, dependent: :destroy

	def favorited_by?(end_user)
		favorites.where(end_user_id: end_user.id).exists?
	end

	belongs_to :end_user
	belongs_to :genre
	attachment :image

	enum selling_status: {
		販売中: 0,
		在庫切れ: 1,
		販売停止: 2
	}
end
