# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.find_or_create_by(name: "laptop", description:"With 8gm ram i3", price:50)
Product.find_or_create_by(name: "mobile", description:"iphone 12 6gb", price:30)
Product.find_or_create_by(name: "refrigerator", description:"5 start Samsung", price:100)