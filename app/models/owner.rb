class Owner < ApplicationRecord 
  self.table_name = :owners
  belongs_to :shop
  has_secure_password
  validates :email, uniqueness: true , presence: true
  validates :password, presence: true, length: { minimum: 8, maximum: 12, message: 'Password must be minimum 8 characters and maximum 12 characters' }, :on => :create
  validates_format_of :email,:multiline => true, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
  has_one :media, as: :mediable, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :media, allow_destroy: true
end
