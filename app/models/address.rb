class Address < ApplicationRecord

	belongs_to :end_user

	validates :address,:post_code,:name, presence: true
end
