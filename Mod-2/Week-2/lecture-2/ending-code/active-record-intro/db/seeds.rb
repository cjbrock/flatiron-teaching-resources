Student.destroy_all
Coffee.destroy_all

5.times do 
    Student.create(name: Faker::FunnyName.name, consumed: [true, false].sample, alertness: rand(1..10))
end


5.times do
    Location.create(country: Faker::Coffee.origin, farm: Faker::Company.name, fair_trade: [true, false].sample)
end


5.times do 
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.variety, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id: 1, location_id: rand(1..5))
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.variety, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id: 2, location_id: rand(1..5))
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.variety, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id: 3, location_id: rand(1..5))
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.variety, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id: 4, location_id: rand(1..5))
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.variety, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id: 5, location_id: rand(1..5))
end