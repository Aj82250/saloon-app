class Shop < ApplicationRecord
	has_one :owner, dependent: :destroy
	has_one :media, as: :mediable, dependent: :destroy
	accepts_nested_attributes_for :media, allow_destroy: true

	has_one :address, as: :addressable, dependent: :destroy
	accepts_nested_attributes_for :address, allow_destroy: true
end
