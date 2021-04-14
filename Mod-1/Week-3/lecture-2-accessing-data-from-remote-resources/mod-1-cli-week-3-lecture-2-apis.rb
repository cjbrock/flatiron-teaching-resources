# Create study group folder
# Create two classes
# talk about how the files relate to each other
# require character class in api class, talk about require relative
require_relative 'character'


# Two options for our project:
  # Covering this because we need data to create our CLI
  # API or Scrape a page to get that info

# what does API stand for?  
  # API -> Apllication Programming Interface
  # Collection of data that someone put together and has allowed others to use!

# In the future, we're going to be creating our own rails-based APIs
# Go to SWAPI, look at documentation
# talk about data structure, what does the structure look like?


# talk about gems, need to install if they're not installed
    require 'rest-client'
    require 'json'
    require 'pry'
    # rest-client, httparty -> allow us to send http requests from ruby

# add rest client line, add pry
    resp = RestClient.get('https://swapi.dev/api/people')
    binding.pry
    resp.body

    # this is JSON! Ruby doesn't know what to do with this. 
    # we need to parse this out
    starwars_hash = JSON.parse(resp.body, symbolize_names:true)
# now we have a ruby representation of what we saw in our we browser!
# you can keep your keys as strings, or you can make them into symbols. it doesn't matter either way, but I like symbols. 

# where does the data live that we care about?
# in results!
    starwars_arr = starwars_hash[:results]


# Go write Character class
class Character
    attr_accessor :name,  :url

    @@all = []

    def initialize(person)
        self.name = person[:name]
        self.url = person[:url]
        @@all << self
    end

    def self.all
        @@all
    end

end

# Write outside of loop, pry into it
starwars_characters = starwars_arr.map do | person |
    binding.pry
end

# Write the rest of the loop
starwars_characters = starwars_arr.map do | person |
    Character.new(person)
end


#ok, that's the first level of the scrape but we only have name and a URL. How do we get more info?
# let's do another scrape!



starwars_characters.each do | char |
    resp = RestClient.get(char.url)
    binding.pry
    char_hash = JSON.parse(resp.body, symbolize_names:true)
end

# need to add getters/setters into the Character class for all attributes we want to capture
:height, :mass, :hair_color, :skin_color, :eye_color,

# need to set the attributes in the method
starwars_characters.each do | char |
    resp = RestClient.get(char.url)
    binding.pry
    char_hash = JSON.parse(resp.body, symbolize_names:true)
    char.height = char_hash[:height]
    char.mass = char_hash[:mass]
    char.hair_color = char_hash[:hair_color]
    char.skin_color = char_hash[:skin_color]
    char.eye_color = char_hash[:eye_color]
end
