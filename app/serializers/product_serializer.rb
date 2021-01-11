class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :kind, :discount_rate, :vendor_id
  
end
