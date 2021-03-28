# run through gem file, talk about gems
# talk about environment file in config folder
# talk about rakefile - need to require the environment file as well as the rake gem, and then it allows us to start a live pry terminal with access to our code. It's kind of like having a live pry terminal, but not being stuck in the middle of a method

# make a new rake task
``` ruby
desc "hi from console"
task :hello do
    puts "Hello World"
end

```

# how many rake tasks do we have access to right now?
# check using (in console)

``` ruby
rake -T
```

# We're going to build a one to many relationship today
# Ask for examples of a one to many relationship that you could build
# draw diagram in lucidChart


# Now we need to create our tables! How do we do that?

# use rake db:create_migration
# what is a migration? it's just a set of instructions to AR that tells AR what to do - create table, columns, delete things, rename things, etc
# you can do something like this if you get lost:

``` ruby
rake db:create_migration
```
# and it will tell you what to do!
# it will automatically namespace it for with that the datetime stamp, so you don't have to worry about the order in which they're run

```ruby
rake db:create_migration NAME=create_whatever_table
```

# note that we didn't have a db or a migrate file, and it created it for us

# now we need to write our migration in the file
```ruby
class CreateOwnersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do | t |
      t.string :name
      t.string :address
    end
  end
end
```

# migrate the db
# If you run it again, you're not going to see anything, and if that happens, then you know that all migrations are up to date

# Your schema file shows what the most up to date version of your database is 

# create a store class in the app/models file
# don't inherit from activeRecord, open pry, create new owner object, call instance.methods.length
``` ruby
class Store

end
```

```ruby
o = Owner.new(name:"whatever", address:"whatever")
```

```ruby
o.methods.length
```

# inherit from ActiveRecord
``` ruby
class Store < ActiveRecord::Base

end
```

# go into pry console, create new store
```ruby
o = Owner.new(name:"whatever", address:"whatever")
```

```ruby
o.methods.length
```

# look at object we've created- it doesn't have an id! what does that tell us?
# it's not saved. what do we do?
# call .save - it's built in to activeRecord now!
# .create is built in as well, which will instantiate and save in one call, but is a bit more problematic because what happens if you have object errors
# what other methods might be built in?
# .all, .find, .find_by_id, .find_by


# Create next table
# rake db:create_migration NAME=create_pets_table
# copy/paste our table migration, add data
# how do we signify our relationship with this table???
# add owner_id

```ruby
class CreatePetsTable < ActiveRecord::Migration[5.2]
  def changeflavor
    create_table :pets do | t |
      t.string :name
      t.string :breed
      t.boolean :adopted
      t.string :fur_color
      t.integer :owner_id
    end
  end
end

```
# Create the pet class
``` ruby
class Pet < ActiveRecord::Base

end
```

# add relationships
# add seeds