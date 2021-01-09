class Product < ApplicationRecord
    belongs_to :vendor 
    validates :price, presence: true
    validates_inclusion_of :kind, :in => ["add", "delete"]
end
