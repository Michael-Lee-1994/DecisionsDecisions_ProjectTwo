# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Choice.destroy_all
Activity.destroy_all

PASS = ["password"]

5.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Name.initials(number: 6), password: PASS.sample)
end


MOVIE_GEN = ["romance", "comedy", "tragedy", "horror"]

100.times do
    temp = rand(0..1)

    if temp == 0
        Activity.create(name: Faker::Movie.title, category: "movie", genre_cuisine: MOVIE_GEN.sample )
    else
        Activity.create(name: Faker::Food.dish , category: "food", genre_cuisine: Faker::Restaurant.type)
    end
end