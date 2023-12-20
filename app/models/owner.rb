class Owner < ApplicationRecord 
  self.table_name = :owners
  belongs_to :shop
  has_secure_password
  validates :password, presence: true 
  validates :email, presence: true, uniqueness: true
  validates_format_of :email,:multiline => true, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
  has_one :media, as: :mediable
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :media, allow_destroy: true
end
