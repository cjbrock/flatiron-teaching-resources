User.destroy_all
Post.destroy_all
5.times do
    User.create(name: Faker::Name.name, email: Faker::Internet.email)
end


15.times do 
    Post.create(title: Faker::Space.agency, body: Faker::Movies::StarWars.quote, user: User.all.sample)
end

puts "seeds planted :-)"