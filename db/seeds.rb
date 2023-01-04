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

avatar = URI.open"https://res.cloudinary.com/di4vjvhde/image/upload/v1672867186/production/gjlsa2slqya94dad7l9x130ms6z5.jpg"

user1.avatar.attach(io: avatar, filename: "nes.png", content_type: "image/png")

puts "user complete"

user2 = Account.create!(email: "tak@gmail.com", password: 123456, username: "tak123")

avatar = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1665161131/development/o66qgi6w2xl0jg1x7p6psgqiefft.jpg")

user2.avatar.attach(io: avatar, filename: "nes.png", content_type: "image/png")

puts "user complete"


user3 = Account.create!(email: "lauren@gmail.com", password: 123456, username: "lauren123")

avatar = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1666685172/production/dr48yzd2kw9njeasomgoi781wtc1.jpg")

user3.avatar.attach(io: avatar, filename: "nes.png", content_type: "image/png")

puts "user complete"

user4 = Account.create!(email: "eriko@gmail.com", password: 123456, username: "eriko123")

avatar = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1666691321/development/749jblszh6agjpyveloq6y4i1gxn.jpg")

user4.avatar.attach(io: avatar, filename: "nes.png", content_type: "image/png")

puts "user complete"

user5 = Account.create!(email: "alex@gmail.com", password: 123456, username: "alex123")

avatar = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1666691537/development/1fftfgdnpds6u0j6f4rbsfbgu2xa.jpg")

user5.avatar.attach(io: avatar, filename: "nes.png", content_type: "image/png")

puts "user complete"

post1 = Post.create(
  content: "Another day!",
  account_id: 1,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1666691523/development/82t2ngufy9ljvf6uvno5h9d4m6cq.jpg")
post1.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")

post2 = Post.create(
  content: "Another day!",
  account_id: 1,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1666690864/development/tjwe56qmcgxlss1v1lkyqqe6bdoz.jpg")
post2.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")

post3 = Post.create(
  content: "How long will it take to burn this off....",
  account_id: 1,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1665162112/development/11yxdg3fujf5o13zmmuqnecxzqhm.jpg")
post3.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")

post4 = Post.create(
  content: "Time to get holiday ready",
  account_id: 2,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1664817683/development/jtpgwi576k9l8yck9w60oawszzk3.jpg")
post4.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")

post5 = Post.create(
  content: "I want to join a sports group. Does anyone have a recommendation?",
  account_id: 2,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1665162005/development/rhquhsogdxtiwsub93zz4ses57zm.jpg")
post5.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")

post6 = Post.create(
  content: "Another day!",
  account_id: 2,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1666608035/development/hdmcwt682l6j5oopctn5iz4z7pmb.jpg")
post6.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")

post7 = Post.create(
  content: "New year, new me!!",
  account_id: 3,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1666691694/development/d9fv0bm89kziral7d54hz8ygewzf.jpg")
post7.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")

post8 = Post.create(
  content: "Time to try some new recipes! Will let you know if I find something nice :)",
  account_id: 3,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1665162091/development/47ssovf87hxly4k0v1z5qbcknpqh.jpg")
post8.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")

post9 = Post.create(
  content: "No pain, no gain",
  account_id: 3,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1666608035/development/hdmcwt682l6j5oopctn5iz4z7pmb.jpg")
post9.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")

post10 = Post.create(
  content: "Another day!",
  account_id: 4,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1666608035/development/hdmcwt682l6j5oopctn5iz4z7pmb.jpg")
post10.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")


post11 = Post.create(
  content: "Loving smoothies lately",
  account_id: 4,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1666691091/development/b00cun5oatzonluauxxt3hdn01jr.jpg")
post11.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")

post12 = Post.create(
  content: "It was a tough one!",
  account_id: 4,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1664380814/fitspo/group_running_jkoazz.jpg")
post12.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")

post13 = Post.create(
  content: "Time to get started! Now or Never",
  account_id: 5,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1672867967/development/ea1c51lpx66cwzn80238fj2si35x.jpg")
post13.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")

post14 = Post.create(
  content: "Lets see if i can beat my record!",
  account_id: 5,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1672867792/development/nwfe7ovz5pl1ta8wtjj1zjmvn33v.jpg")
post14.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")

post15 = Post.create(
  content: "Daily yoga <3!",
  account_id: 5,
)
photo = URI.open("https://res.cloudinary.com/di4vjvhde/image/upload/v1672867790/development/tpi17hvpvnsdwtv6826ekdvqggtp.jpg")
post15.photo.attach(io: photo, filename: "nes.png", content_type: "image/png")
