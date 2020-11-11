# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NUMBER_OF_CATEGORY = 5
PRODUCTS_PER_CATEGORY=5


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
puts "created #{Category.count} Categories"
puts "Created #{Product.count} Products"AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?