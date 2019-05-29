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

beverage1 = Beverage.new(user: seller, name: "Cerva do Frei", price: 27.99, stock: 12, genre: "cerveja", category: "Ale", brand: "Freizão Co.", description: "Uma cerveja encorpada, com alto amargor e leve toque apimentado")
beverage1.remote_photo_url = "https://images.unsplash.com/photo-1549231482-5cf39d19fba4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=633&q=80"
beverage1.save

beverage2 = Beverage.create!(user: other_seller, name: "Cachaça do Araújo", price: 59.90, stock: 5, genre: "cachaça", category: "Ouro", brand: "Araújo Co.", description: "Envelhecida em barril de carvalho francês por 12 anos")
beverage2.remote_photo_url = "https://www.esquinademinas.com.br/wp-content/uploads/2016/09/Cachaca-Coracao-de-Minas-Suprema-12-anos-750ml.jpg"
beverage2.save
