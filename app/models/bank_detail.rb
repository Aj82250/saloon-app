class BankDetail < ApplicationRecord
	has_one :media, as: :mediable
	has_one :address, as: :addressable
end
