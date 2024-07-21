# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env.development?
  # Create Admin user
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.find_by(email:'admin@example.com').blank?

  # Create 4 products
  4.times do |i|
    Category.create!(name: Faker::Book.genre)
  end

  # Create 100 products
  Category.all.each do |c|
    25.times do |i|
      c.products.create!(
        title: Faker::Book.title,
        description: Faker::Lorem.paragraph,
        author: Faker::Book.author,
        price: Faker::Number.decimal(l_digits: 2),
        stock: Faker::Number.number(digits: 2))
    end
  end
end
