# Object Relationships
## MIGHT NEED TO JUST PUT TRUE UNDER PRY TO GET IT TO TRIGGER
# Why do we need them?
## Used to mirror real-world applications
## Great, but how does this work?
## Let's draw one!

# can't go anywhere, so let's fantasize about it :-) 
# draw out in LucidChart
# What relationship examples have you encountered in the real world or in programming?

# talk about three files already created
# define Passenger class, write initialize method, add attr accessors
class Passenger

  attr_accessor :name, :fav_destination


  def initialize(name, fav_destination)
    @name = name
    @fav_destination = fav_destination
  end
end

# define ticket class, write initialize method, add attr accessors

class Ticket

  attr_accessor :flight_number, :destination, :airline


  def initialize(seat_number, destination, airline)
    @seat_number = seat_number
    @destination = destination
    @airline = airline

  end
  

end

# create passengers for test data in run file
a = Passenger.new("corinna", "Paris")
b = Passenger.new("corinn", "Pari")
c = Passenger.new("corin", "Par")

# create tickets in run file

d = Ticket.new("b21", "Paris", "United")
e = Ticket.new("b22", "Paris", "United")
f = Ticket.new("b23", "Paris", "United")

# ask students to create their own person, drop in chat

# Now, we need a way to be able to assign our ticket instances to our passengers

# set :passenger in the attr_accessors in ticket

class Ticket

  attr_accessor :seat_number, :destination, :airline, :passenger


  def initialize(seat_number, destination, airline)
    @seat_number = seat_number
    @destination = destination
    @airline = airline
  end


  ## it's the same as doing it manually!
  # def passenger=(pass)
  #   @passenger=pass
  # end


end

# in run, assign tickets to passengers

d.passenger = a
e.passenger = b
f.passenger = c


# check in pry! this is good for our ticket side, but passenger doesn't know about it's tickets yet. 

# can call the ticket, and see the passenger, but the person doesn't know about it's tickets

# what will happen if I run person.tickets?

# how do I associate a person with all their tickets?
# can I just add :tickets in the attr_accessors? No, because it's always going to overwrite itself

# add @tickets = [] to initialize in passenger

class Passenger

  attr_accessor :name, :fav_destination


  def initialize(name, fav_destination)
    @name = name
    @fav_destination = fav_destination
    @tickets = []
  end

end

# write get_tickets method - this is kind of our setter method
def get_ticket(ticket)
  @tickets << ticket
end

# why is this an instance variable and not a class variable?
# try calling person.tickets again, same error - no reader!

# add attr_reader in passenger class
attr_reader :tickets

# now we can call person.tickets! but it still isn't shoveling the tickets in.
# could call from the passenger side, with get_tickets
# in run file, comment out the ticket.passenger assignment
# call with person.get_tickets(ticket)
person.get_tickets(ticket)
# now the ticket doesn't know about it's passenger (show in pry)

# we need a custom writer in our ticket class
# in ticket class
  # move :passenger to attr_reader
  # write custom writer
  def passenger=(pass)
    @passenger=pass
    pass.get_tickets(self)
  end

# in passenger class, adjust get_ticket method
def get_tickets(ticket)
  @tickets << ticket
  ticket.passenger ||= self
end

# in a one to many relationship, the many side should always be our single source of truth for being responsible for holding our data for the many relationship

# this is SUPER messy. let's clean it up, and make tickets responsible for tracking passengers

# add @@all to ticket, move :passenger to attr_accessor, add @@all class method, comment out custom writer

class Ticket

  @@all = []

  attr_accessor :flight_number, :destination, :airline, :passenger


  def initialize(seat_number, destination, airline)
    @seat_number = seat_number
    @destination = destination
    @airline = airline
    @@all << self
  end

  def self.all
    @@all
  end
  
  # def passenger=(pass)
  #   @passenger=pass
  #   pass.get_tickets(self)
  # end

end

# on passenger side, remove tickets array from initialize and reader
# change get_tickets to tickets

class Passenger

  attr_accessor :name, :fav_destination


  def initialize(name, fav_destination)
    @name = name
    @fav_destination = fav_destination
    @tickets = []
  end

  def tickets
    Ticket.all.select { | ticket | ticket.passenger == self }
  end

end


# what if I wanted to set the ticket from the passenger side?
def ticket=(ticket)
  ticket.passenger = self
end

# should be able to do ticket.person = ticket now


______---_________________________________---_______________________

# Has many through
# Add flights, flights has many passengers through tickets
