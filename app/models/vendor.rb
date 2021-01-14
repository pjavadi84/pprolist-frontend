class Vendor < ApplicationRecord
    has_many :products
    validates :name, :total_cost, presence: true
    validates :name, uniqueness: true

    def update_total_cost(product) 
        if product.kind == 'standard' && product.discount_rate == 0
          self.total_cost += product.price
          self.save
        elsif product.kind == 'discount' && 0 < product.discount_rate && product.discount_rate< 1
            product.price = (product.price-(product.price * product.discount_rate))
            if product.price
                self.total_cost += product.price
                self.save
            else
                return 'total cost can not be less than product price.'
            end
        else
            return 'product kind must be set as standard or at discount'
        end
    end

    
    
    def update_total_cost_on_product_deletion(product)
        if product.price <= self.total_cost
            self.total_cost -= product.price
            self.save
        else
            self.total_cost == 0
            self.save
            return 'total cost can not be negative'
        end
    end
end
