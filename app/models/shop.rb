class Shop < ApplicationRecord
	has_one :owner, dependent: :destroy
	has_one :media, as: :mediable
end
