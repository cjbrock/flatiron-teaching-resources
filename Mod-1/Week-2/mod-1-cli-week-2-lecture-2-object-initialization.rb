# Slides!

# Local variables 
# - write method
# - define local variable - SLIDE 5
# - add pry, show that you don't have access outside of method

def whatever
    var = "hey there"
    puts var
  end
  
  binding.pry
  
  # instance variables
  # - instance variables have the scope of the entire instance of the object
  # - need a method to manipulate the instance
  # - when we create the object, we create scope
  
  
  
  
  # After the problem slide - create a class and an instance method
  
  
  
    class Car
  
      def set_make
        @make = "Honda"
      end
  
    end
  
    car = Car.new
  
    binding.pry
  
  # can take in a parameter (more slide)
  
  class Car
  
    def set_make(make)
      @make = make
    end
  
    def testing
      binding.pry
    end
  
  end
  
  car = Car.new
  
  binding.pry
  
  
  # call c.set_make("whatever"), then call testing, show that you have access to @make for your car
  # once your outside your class again, show that you don't have access to @make
  
  # what kind of method is set_make right now? it's a setter method!
  # keep going through the slides
  # ok, but how are we actually going to return the value of our instance variable?
  # getter methods!
  
  
  # write some getter methods
  # write some setter methods (can just use attr_accessors)
  
  class Car
  
    def set_make(make)
      @make = make
    end
  
    def get_make
      @make
    end
  
    def set_model(model)
      @model = model
    end
  
    def get_model
      @model
    end
  
    def set_year(year)
      @year = year
    end
  
    def get_year
      @year
    end
  
    def testing
      binding.pry
    end
  
  end
  
  car = Car.new
  
  binding.pry
  
  # in pry, write some attributes, retrieve some attributes
  
  # show exceptions
  car.instance_variable_set(:@year, 2002)
  # DON'T DO THIS
  car.instance_variable_get(:@year)
  
  
  # for attr_accessor
  car.methods.length
  # then add another attr, show that the number of methods have increased
  # for just writer, maybe just VIN
  
  # Initialize!!!
  
  # Initialize allows you to pass in attributes to an objecct at the time of instantiation
  
  
  ---------------------------------------------------------------------------------------------------------
  # # 2. Run through the code from yesterday, orient everyone to how we're initializing people currently with Person.new, getting a new instance of the Person class
  
  # # 3. Add to class:
  # attr_accessor :name, :age
  # person1.energy_level = 100
  # person1.name = "Whoever"
  # person1.age = 12
  
  # binding.pry
  
  #   # run code in terminal
  #   #show that we have access to read and write
  #   #what if we just wanted to have a getter? just a setter? manual setters and getters allow us to do some custom processing (convert to percentages, etc)
  
  # # 4. initializers! basically tell us that every time we create a person, we want them to always have those attributes
  #   def initialize(name, age, energy_level)
  #     @name = name
  #   end
  #   # depending on what you want to initialize with, you pass those properties to you creation of the instance, so our Person.new becomes this:
  #   Person.new("Whoever")
  #   # now we have a name on initialization
  
  #   # we can also set defaults on initialization
  #   # add a default for energy level
  
  #   # do we still need our attr_accessors? Depends on whether we need to change them outside of initialization. If we had a bank application, we might want to be able to read the balance, but not everyone can change it. 
  
  #   # the order that you pass your arguments in matters. make sure that you're passing the arguments in in the order that you're listing them in the method. show with name and age in the wrong order.
  
  # # 5. Add a study method, and decrease the energy level by calling it a few times, then sleep, ask about what the energy level should be now
  
  #   #create another instance, make them sleep a few times, drop into pry, show the two different instances and how they don't at all interfere with each other, yay everything is super powerful and wonderful
  
  