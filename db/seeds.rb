# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vendor1 = Vendor.create(name: "Costco", total_cost: 0)
product1 = Product.create(vendor_id: 1, name: "Brorganics - 1 gallon milk", description: "1 gallon organic milk", price: 10.00, kind:"standard", discount_rate: nil )
product2 = Product.create(vendor_id: 1, name: "Safechipz - Large potato chips", description: "1 bag of organic chips", price: 8.00, kind:"discount", discount_rate: 0.2)