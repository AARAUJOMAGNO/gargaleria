# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.first
Beverage.create!(user: user, name: "Cerva do Frei", price: 27.99, stock: 12, genre: "cerveja", category: "ALE", brand: "Freizão Co.", description: "Uma cerveja encorpada, com alto amargor e leve toque apimentado")

Beverage.create!(user: user, name: "Cachaça do Frei", price: 59.90, stock: 5, genre: "cachaça", category: "Ouro", brand: "Freizão Co.", description: "Envelhecida em barril de carvalho francês por 12 anos")

