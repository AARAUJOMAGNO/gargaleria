# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

user = User.new(email: "teste@user.com", password: "123123", terms: true)
user.save

other_seller = User.new(email: "teste2@seller.com", password: "123123", terms: true, seller: true)
other_seller.save

seller = User.new(email: "teste@seller.com", password: "123123", terms: true, seller: true)
seller.save

user = User.first

Beverage.create!(user: seller, name: "Cerva do Frei", price: 27.99, stock: 12, genre: "cerveja", category: "Ale", brand: "Freizão Co.", description: "Uma cerveja encorpada, com alto amargor e leve toque apimentado")

Beverage.create!(user: other_seller, name: "Cachaça do Araújo", price: 59.90, stock: 5, genre: "cachaça", category: "Ouro", brand: "Araújo Co.", description: "Envelhecida em barril de carvalho francês por 12 anos")
