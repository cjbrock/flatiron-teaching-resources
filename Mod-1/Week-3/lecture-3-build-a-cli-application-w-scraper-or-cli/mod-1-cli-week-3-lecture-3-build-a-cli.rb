# Yesterday, we built a couple of files, and we got our data. How do we go from just data to a functioning CLI?

# Today we are going to:
# - encapsulate our API file in a class
# - create a CLI class to interact with our user
# - create a run file to serve as an environment file and run our program

# generally, the structure of a CLI project is going to have two folders, a bin folder that will have your executable, and a lib folder, where your classes live. so we'll move the two existing classes (or what will be classes) into the lib folder, and create the bin folder)

- create bin and lib folders, move api and character files

# executable files are unique in the ruby file structure, in that they don't have an extension. we can call them run, but i'm going to name mine after my project.

- create executable star-wars

# in our executable, this is the first thing that we're going to run, and so within this file all the gems that we need are going to be necessary, as well as all the files that we need for our program. Let's move the gems we need over


require 'rest-client'
require 'json'
require 'pry'

require_relative '../lib/api'
require_relative '../lib/character'


# also need to change the order, talk about changing hte path because reasons, etc

# also need to add the shebang - tells the program that we're executing a ruby file

#!/usr/bin/env ruby

# ok, now let's encapsulate the API file in a class

class API

    def self.scrape_characters 
        resp = RestClient.get('https://swapi.dev/api/people')
        starwars_hash = JSON.parse(resp.body, symbolize_names:true)
        starwars_arr = starwars_hash[:results]
        starwars_characters = starwars_arr.map do | person |
            Character.new(person)
        end
    end

        #NEED TO WRITE THIS FUNCTIONALITY

        starwars_characters.each do | char |
            resp = RestClient.get(char.url)
            binding.pry
            char_hash = JSON.parse(resp.body, symbolize_names:true)
            char.height = char_hash[:height]
            char.mass = char_hash[:mass]
            char.hair_color = char_hash[:hair_color]
            char.skin_color = char_hash[:skin_color]
            char.eye_color = char_hash[:eye_color]
        endcd
    
    
    def self.scrape_individual_characters(char)
        starwars_characters.each do | char |
            resp = RestClient.get(char.url)
            char_hash = JSON.parse(resp.body, symbolize_names:true)
            char.height = char_hash[:height]
            char.mass = char_hash[:mass]
            char.hair_color = char_hash[:hair_color]
            char.skin_color = char_hash[:skin_color]
            char.eye_color = char_hash[:eye_color]
        end
    end
    
    
    end


# ok, now let's work on some user interaction!

class CLI
    def run
        puts "this is a test"
    end
end

# require it in your bin, run it in terminal

class CLI
    def run
        puts "Welcome to the Star Wars Character database!"
        puts "Please choose a character to see more information:"
        API.scrape_characters
        list_characters
    end

    def list_characters
        Character.all.each.with_index(1) do | character, i|
          puts "#{i}. #{character.name}"
        end
    end
end

# now write the menu, call from run

def menu
    puts "Please select a number to get the details."
    input = gets.chomp
    if !input.to_i.between?(1, Character.all.count)
        puts "Character not found. Please select a different movie!"
        list_characters
        menu
    else
        character = Character.all[input.to_i-1]
        display_character_details(character)
    end
    puts "Would you like to see another character?"
    puts "Please enter Y or N"
    another_character = gets.strip.downcase
    if another_character == "y"
        list_characters
        menu
     elsif another_character == "n"
        puts "Do or do not. There is no try."
        exit
    else
        puts "Darth Vader garbled your answer. Please try again."
        list_movies
        menu
    end  
end

# write list characters

def display_character_details(character)
    API.scrape_individual_characters(character)
    puts "Here are the details for #{character.name}:"
    puts "Height: #{character.height}"
    puts "Mass: #{character.mass}"
    puts "Hair Color: #{character.hair_color}"
    puts "Skin Color: #{character.skin_color}"
    puts "Eye Color: #{character.eye_color}"
  end

  # need to solve loop issues

  