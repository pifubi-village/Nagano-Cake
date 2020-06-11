class Address < ApplicationRecord

	belongs_to :end_user

    validates :Address, presence: true
    validates :post_code, presence: true
    validates :name, presence: true
end
