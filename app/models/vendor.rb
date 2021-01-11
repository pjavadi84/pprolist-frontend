class Vendor < ApplicationRecord
    has_many :products
    validates :name, :total_cost, presence: true
    # validates :name, uniqueness: true

    def update_total_cost(product)
        if product.kind == 'standard' && (!product.discount_rate || product.discount_rate == 0.0)
          self.total_cost += product.price
          self.save
        elsif product.kind == 'discount' && (product.discount_rate && 0<product.discount_rate<1)
            product.price += (product.price * product.discount_rate)
            if self.total_cost >= product.price
                self.total_cost += product.price
                self.save
            else
                return 'total cost can not be less than product price.'
            end
        else
            return 'product kind must be set or typed as standard or at discount'
        end
      end

    def update_total_cost_on_discount(product)
        if product.kind == 'standard' && (!product.discount_rate || product.discount_rate == 0.0)
            if self.total_cost >= product.price
                self.total_cost -= product.price
                self.save
            else
                return 'total cost can not be less than product price.'
            end
        elsif (product.kind == 'discount') && (product.discount_rate && 0<product.discount_rate<1)
            product.price += (product.price * product.discount_rate)
            self.total_cost += product.price
            self.save
        end
    end
end
