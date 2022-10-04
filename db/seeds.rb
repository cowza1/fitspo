# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destorying Accounts"

Account.destroy_all

user1 = Account.create!(email: "adam@gmail.com", password: 123456, username: "adam123")
user2 = Account.create!(email: "tak@gmail.com", password: 123456, username: "tak123")
user3 = Account.create!(email: "lauren@gmail.com", password: 123456, username: "lauren123")
user4 = Account.create!(email: "eriko@gmail.com", password: 123456, username: "eriko123")
user5 = Account.create!(email: "alex@gmail.com", password: 123456, username: "alex123")

puts "Created accounts"
