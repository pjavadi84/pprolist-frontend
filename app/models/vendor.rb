class Vendor < ApplicationRecord
    has_many :products
    validates :name, :total_cost, presence: true
    validates :name, uniqueness: true

    def update_total_cost(product)
        if product.kind == 'add'
          self.total_cost += product.price
          self.save
        elsif product.kind == 'delete'
          if self.total_cost >= product.price
            self.total_cost -= product.price
            self.save
          else
            return 'total cost can not be less than product price.'
          end
        end
      end

    def update_total_cost_on_delete(product)
        if product.kind == 'add'
            if self.total_cost >= product.price
                self.total_cost -= product.price
                self.save
            else
                return 'total cost can not be less than product price.'
            end
        elsif product.kind == 'delete'
            self.total_cost += product.price
            self.save
        end
    end
end
