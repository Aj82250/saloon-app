class Owner < ApplicationRecord 
  self.table_name = :owners
  # belongs_to :shop
  has_secure_password
  validates :email, :password, presence: true
end
