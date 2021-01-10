class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :kind, :vendor_id
  
end
