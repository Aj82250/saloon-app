class ShopSerializer < ActiveModel::Serializer
  attributes :id, :shop_start_time, :shop_end_time, :shop_availability, :full_phone_number, :created_at, :updated_at
end
