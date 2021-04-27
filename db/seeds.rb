# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  { name: "Eric", email: "er@server.io", password: "azerty" },
  { name: "Jo", email: "jo@server.io", password: "azerty" }
])

eric = User.first
eric.update(role: 'admin', password: 'azerty')

Car.create([
  { name: 'Ferari', price: 500, description: 'An italian car' },
  { name: 'Pininfarina', price: 700, description: 'A well designed car' }
])
