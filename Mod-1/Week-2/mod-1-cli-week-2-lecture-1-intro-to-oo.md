# Notes
## start with blank file and require 'pry'
- compare JS and ruby
- what is OO and how does is compare to procedural code that we've been writing so far?

- what is object orientation?
    - give objects characteristics and behaviors
    - can give them attributes and methods

- talk about objects in the real world - characteristics of objects (pen - black, gel, millimeter, etc)
- objects allow us to track properties that are specifically associated with those objects

### procedural tracking of data
- if we were trying to track those properties with procedural, how could we do that?
- use a hash!
- create variables and people

```ruby
person1 = {name: "Anthony", age: 21}
person2 = {name: "Gavin", age: 21}

puts person1[:name]
```
- run in terminal
ruby examples.rb

#### methods in procedural

```ruby
    def speak
        puts "Hello I'm Anthony"
    end
```
how to refactor to use the hash?

```ruby
    def speak(person)
        puts "Hello I'm #{person[:name]}"
    end
    speak(person1)
    speak(person2)
```
## issues!

 - this is going to get really long really fast. And they're not specific to only people - you can call them on any object you want. Classes give us a way to protect our methods and ONLY be able to call them on the objects we want to call them on! No one wants sentient objects. 

- add new hash object with hair color, hair color to only one object
```ruby
person1 = {name: "Anthony", age: 21}
person2 = {name: "Gavin", age: 21}
person3 = {name: "Todd", age: 21, hair_color: "salt_and_pepper"}


def speak(person)
    puts "Hello I'm #{person[:name]} and my hair color is #{hair_color}"
end

speak(person1)
speak(person2)
speak(person3)
```
- what is going to happen when we run this?

#### Sidebar: irb
- go into IRB
- [1, 2, 3].class
- [1, 2, 3].methods
- will show you all the methods that are available to be used on the array class

### Sidebar: protected words

class String

class Array

- don't overwrite the default functionality! call it my_string or my_array

## Refactor into OO Ruby!!!

- Let's make a person class
    -ask for people activities

```ruby
class Person

  def speak
    puts "hello"
  end

  def sneeze
    puts "Achoo! That food was really peppery."
  end

  def sleep
    puts "feeling rested, energy level reset to: "
  end

end
```

### Setters and Getters

#### Manual

- today we'll do manual getters and setters, we'll do initialize tomorrow!
- we'll set energy level for sleep

```ruby
    def energy_level #manual_getter/reader - when this is called, returns value of our instance variables
        @energy_level
    end

    def energy_level=(el)
        @energy_level = el
    end
```
- in the setter, a lot of times you'll see the method name, the argument, and the instance variable all called the same thing. You don't have to if you find it confusing, and it can help clear things up if you don't. Our manual setter here will set the value of our instance variable to whatever we're passing in to our method. 

#### Attr Readers and Writers
- refactor into:

```ruby
   attr_reader :energy_level
   attr_writer :energy_level
```

- and then
```ruby
   attr_accessor :energy_level
```

- these are called macros. They write code in the background for us. 

### Scope

- what's the scope of the instance variable that we're working with? it's within the object itself. every single person is going to have it's own energy level. 

### Create a person!

- outside of the class!

```ruby
require 'pry'

class Person

    attr_accessor :energy_level

    def speak
      puts "hello"
    end
  
    def sneeze
      puts "Achoo! That food was really peppery."
    end
  
    def sleep
      puts "feeling rested, energy level reset to:"
    end
  
  end

  person1 = Person.new

  binding.pry

  ```

  - call person1 in pry
  - set energy level
  - call methods
  - what kind of methods are these? instance
  
  - let's affect our energy level in our sleep method
  - adjust to add count to sleep
  - talk about self
  ```ruby
   def sleep
      puts self
      @energy_level += 5
      puts "feeling rested, energy level reset to: #{energy_level}"
    end
    ```
  - ruby is smart enough to know that because we're in an instance method, and we're dealing with the instance of person, the energy level that we want is the energy level that is associated with the person. It's an implied self. It would work with self.energy_level, or @energy_level, or energy_level.




