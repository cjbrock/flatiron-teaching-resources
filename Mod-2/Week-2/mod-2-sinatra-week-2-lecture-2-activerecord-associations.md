# create the coffee model

# add faker gem
```ruby
gem 'faker'
```

# add seeds (5 times)
```ruby

Student.destroy_all
Coffee.destroy_all

Student.create(name: Faker::Name.name, consumed: [true, false].sample, alertness: rand(1..10))
Student.create(name: Faker::Name.name, consumed: [true, false].sample, alertness: rand(1..10))
Student.create(name: Faker::Name.name, consumed: [true, false].sample, alertness: rand(1..10))
Student.create(name: Faker::Name.name, consumed: [true, false].sample, alertness: rand(1..10))
Student.create(name: Faker::Name.name, consumed: [true, false].sample, alertness: rand(1..10))

5.times do
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.notes, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id:1)
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.notes, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id:2)
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.notes, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id:3)
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.notes, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id:4)
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.notes, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id:5)
end
```


# add relationships
    - write my_coffees in students, and my_student in coffees
    - in console, look at Coffee.all and Student.all
    - ask for ideas about how we can look for the coffees manually
    - 
```ruby 
    def my_coffees
        Coffee.all.where(student_id: self.id)
    end

    def my_student
        Student.all.find_by(id: self.student_id)
    end

```

# show AR shortcuts!
# add in macros
# talk about pluralizer
# show all methods in console
# This is how we do relationships forever

# now we're going to do a has_many through!
# need to figure out how to add in another relationship here, we could to brands (ask for other ideas?)
# look at LucidChart, add stuff to diagram

# list out steps to creating the has many through

 - need to create brands table
 - create brands migration
 - create brands class
 - add foreign key column to coffee table

# create brand table migration
# add foreign key to coffee table
# add brand class
# Add brands to seed file

```ruby
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.notes, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id:1, brand_id: rand(1..5))
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.notes, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id:2, brand_id: rand(1..5))
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.notes, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id:3, brand_id: rand(1..5))
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.notes, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id:4, brand_id: rand(1..5))
    Coffee.create(name: Faker::Coffee.blend_name, flavor: Faker::Coffee.notes, espresso_shots: rand(1..4), size: ["small", "medium", "large"].sample, student_id:5, brand_id: rand(1..5))

    ```

# create associations

# Show things you can do in console, like call an individual student, then student.brands, then student.brands.uniq
