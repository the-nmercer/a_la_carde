# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.delete_all
Category.delete_all

categories = [
  Category.create(name: "Tabletop Games", description: "Board games, strategy games, and other tabletop games."),
  Category.create(name: "Miniatures", description: "Miniature figurines for tabletop games like Warhammer and D&D."),
  Category.create(name: "Dice", description: "Various dice sets for tabletop RPGs and board games."),
  Category.create(name: "Game Accessories", description: "Accessories like game mats, card sleeves, and storage solutions."),
  Category.create(name: "Card Games", description: "Trading card games and related accessories."),
  Category.create(name: "Role-Playing Games", description: "Books, rule sets, and materials for role-playing games like D&D.")
]

100.times do
  product = Product.create(
    name: Faker::Commerce.product_name.capitalize,
    description: Faker::Lorem.sentence,
    price: Faker::Commerce.price,
    stock_quantity: Faker::Number.between(from: 1, to: 100),
    category: categories.sample
  )
end

