class VendorSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_cost
  has_many :products
end
