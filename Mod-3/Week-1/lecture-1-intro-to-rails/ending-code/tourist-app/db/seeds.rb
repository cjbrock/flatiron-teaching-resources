# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
    Tour.create(name: Faker::TvShows::TwinPeaks.character, location: Faker::Address.city, activities: Faker::FunnyName.name,cost: rand(5.00..1000000.00))
    
end

25.times do
    Tourist.create(name: Faker::Name.name, hometown: Faker::Address.city, ticket_paid: [true, false].sample, tour_id: rand(2..6))
end

