class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number, :shop, :created_at, :updated_at, :address, :media
end
