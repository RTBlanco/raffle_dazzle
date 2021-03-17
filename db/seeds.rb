# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
batman = User.create(name: "bruce wayne", username: "batman", email: "batman@bat.com", password: "testtest", password_confirmation: "testtest")
robin = User.create(name: "damian wayne", username: "robin", email: "robin@bat.com", password: "testtest", password_confirmation: "testtest")

raffle = batman.raffles.build(title: "this title", item: "raffle", goal: "4000", description: "this is a description" )
raffle.save