# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NUMBER_OF_CATEGORY = 5
PRODUCTS_PER_CATEGORY=5

Product.destroy_all
Category.destroy_all
AdminUser.destroy_all

NUMBER_OF_CATEGORY.times do
  category = Category.create(name: Faker::Name.unique.name)
  PRODUCTS_PER_CATEGORY.times do
    product  = category.products.create(
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price,
      description: Faker::Lorem.sentence(word_count: 3),
      sale: rand(1..3),
      priceonsale: Faker::Commerce.price
    )
  end

end

# url = 'http://makeup-api.herokuapp.com/api/v1/products.json'
# uri = URI(url)
# response = Net::HTTP.get(uri)
# categories = JSON.parse(response)

# # puts url + "?=may"
# categories.each do |b|
#   # puts "#{b["brand"]}"
#   category = Category.find_or_create_by(name: b["brand"])
#   if category&.valid?
#     url = "http://makeup-api.herokuapp.com/api/v1/products.json" + "?brand=" + "#{b["brand"]}"
#     uri = URI(url)
#     response = Net::HTTP.get(uri)
#     products = JSON.parse(response)
#     # puts url
#     products.each do |p|
#       product = category.products.create(name: p["product_type"], price: p["price"],description: p["description"],sale: rand(1..3), priceonsale: Faker::Commerce.price )
#      end
#     end
#   end







puts "created #{Category.count} Categories"
puts "Created #{Product.count} Products"


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?