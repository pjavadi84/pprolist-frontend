class AddDiscountRateToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :discount_rate, :float
  end
end
