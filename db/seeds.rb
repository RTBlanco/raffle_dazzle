# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
batman = User.create(name: "bruce wayne", username: "batman", email: "batman@bat.com", password: "testtest", password_confirmation: "testtest")
robin = User.create(name: "damian wayne", username: "robin", email: "robin@bat.com", password: "testtest", password_confirmation: "testtest")

super_man = User.create(name: "Clark Kent", username: "Superman", email: "superman@krypton.com", password: "testtest", password_confirmation: "testtest") 
super_boy = User.create(name: "Jon Kent", username: "Superboy", email: "superboy@krypton.com", password: "testtest", password_confirmation: "testtest")

spiderman = User.create(name: "Peter Parker", username: "Spiderman", email: "spiderman@spider.com", password: "testtest", password_confirmation: "testtest")
spiderwomen = User.create(name: "Jessica Drew", username: "Spiderwoman", email: "spiderwoman@spider.com", password: "testtest", password_confirmation: "testtest")

melanie = User.create(name: "Melanie Toribio", username: "Mel", email: "mel@fam.com", password: "testtest", password_confirmation: "testtest")
samira = User.create(name: "Samira Toribio", username: "Samsam", email: "sam@fam.com", password: "testtest", password_confirmation: "testtest")
roslia = User.create(name: "Roslia Toribio", username: "LIA", email: "lia@fam.com", password: "testtest", password_confirmation: "testtest")
rosy = User.create(name: "Rosy The Dog", username: "doggie", email: "doggie@fam.com", password: "testtest", password_confirmation: "testtest")
guancho = User.create(name: "Guancho The Gecko", username: "Overlord", email: "god@fam.com", password: "testtest", password_confirmation: "testtest")



batman.raffles.build(title: "Bat mobile", item: "car", goal: "100000",cost: 100000.0 / 20  , description: "this is not the real one!").save
robin.raffles.build(title: "The real Bat Mobile", item: "car", goal: "5000000",cost: 5000000.0 / 20 ,  description: "Bruce wayne does not pay me at all").save
super_man.raffles.build(title: "The Super car", item: "car", goal: "5000000",cost: 5000000.0 / 20 ,  description: "Why would I, Superman need a car when i can fly?").save

guancho.raffles.build(title: "Nikes air force", item: "Shoes", goal: "5500",cost: 5500.0 / 20 ,  description: "My owner's shoes" ).save
guancho.raffles.build(title: "Worn Levis ", item: "pants", goal: "5500",cost: 5500.0 / 20,  description: "My owner's pants, he has no idea that im selling his stuff").save
guancho.raffles.build(title: "Xbox one X", item: "console", goal: "300",cost: 300.0 / 20,  description: "My owner's xbox, He'll sure be looking for this soon").save
guancho.raffles.build(title: "Baby Yoda", item: "Toy", goal: "300",cost: 300.0 / 20,  description: "My owner's favorite toy, imagine being an adult and still buying toys").save
guancho.raffles.build(title: "Gucci Glasses", item: "glasses", goal: "1000",cost: 1000.0 / 20,  description: "My owner's glasse, imagine spending that much money to SEE").save

guancho.raffles.build(title: "Magical Gecko Powers", item: "Powers", goal: "3000000",cost: 3000000.0 / 20,  description: "I am overlord!!").save


