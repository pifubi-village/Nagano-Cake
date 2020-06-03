class LineItem < ApplicationRecord

	belongs_to :good
	belongs_to :cart
end
