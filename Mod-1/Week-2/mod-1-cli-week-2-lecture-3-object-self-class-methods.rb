#Run through our class from yesterday, orient everyone, talk about the behaviour that we have going on right now


# Self keyword slide -

# - add 
puts self
# in class, run file
# demo that it is the class, vs self when you're in the instance it's the instance


# Remember that this is always the IMPLIED SELF
# make a testing method

def i_method
  puts self
end

# take out puts self in class
# call on instance in pry

# new write second method, and call from first

def i_method
  self.second_method
end

def second_method
  puts "in second method"
  puts self
end

# self is dynamic - it becomes whatever instance has invoked the method BECAUSE they are instance methods. It's whatever is passed into the method by invoking it. 
# in instance methods, self is the instance that called it ALWAYS
# in class methods, self is the class

# now, can we call it without the self?

def i_method
  second_method
end

def second_method
  puts "in second method"
  puts self
end

## Class variables

# add 
@@hi
# at top

puts @@hi

# at bottom, run file

# what do we use for class variables? usually all

@@all = []

# keep going with slides

#write class method

def self.hi_from_class
  puts "hi from #{self}"
end

# have to call this on the class, NOT an instance

#could also say this:

def Cereal.bye_from
  puts "bye from #{self}"
end

# if you use self, it will dynamically change, wheras if you use Cereal, you have to change all of them
# can we call these from an instance?
# nope, call on the class only

# call bye from hi

def self.hi_from_class
  puts "hi from #{self}"
  self.bye_from
end


def Cereal.bye_from
  puts "#{self}'s in hi!'"
end

# could we remove the self here?

def self.hi_from_class
  puts "hi from #{self}"
  bye_from
end


def Cereal.bye_from
  puts "#{self}'s in hi!'"
end

# implied self works almost everywhere, unless you have variables and methods named the same thing. 
 #in actual useful class methods

 def self.all
  @@all
 end

 def self.all=(all)
    @@all = all
 end

 # so we could do that, but let's do something better

 # add @@all to initialize to track all our instances
 # add another cereal to instances
 nb = Cereal.new("Nutter Butter", "Nabisco", 13, false)

 # add a find

 def self.where_brand_is(brand)

 end

 # code 
 def self.where_brand_is(brand)
  self.all.find_all{| cereal | cereal.brand == brand }
 end