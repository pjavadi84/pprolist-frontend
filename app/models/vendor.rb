class Vendor < ApplicationRecord
    has_many :products
    validates :name, :total_cost, presence: true

    def update_total_cost(product)
        if product.kind == 'add'
          self.total_cost += product.price
          self.save
        elsif product.kind == 'delete'
          if self.total_cost >= product.price
            self.total_cost -= product.price
            self.save
          else
            return 'total cost is lower than the product price.'
          end
        end
      end
end
