class BankDetail < ApplicationRecord
	has_one :media, as: :mediable
end
