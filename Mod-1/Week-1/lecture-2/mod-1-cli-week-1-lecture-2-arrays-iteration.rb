# What are arrays?

# list or collection of data (strings, integers, booleans, arrays, hashes, objects)

#array construction

# array_1 = ["Hello", "World"]
# # puts array_1

# # array_2 = Array.new(5, "Buzz")
# # puts array_2

# #access an element in an array

# # array_1[0] - first element
# # array_1[-1] - last element

# # destructive methods
# array_1[1]="Bye" #["Hello", "Bye"] 

# # add an element
# array_1 << "Wazzup" #["Hello", "Bye", "Wazzup"] 
# array_1.push("Peace out") #["Hello", "Bye", "Wazzup", "Peace out"] 

# #remove an element from the front of an array
# first_element = array_1.shift # ["Bye", "Wazzup", "Peace out"] 

# # add an element to the beginning of an array
# array_1.unshift("!") #["!", "Bye", "Wazzup", "Peace out"] 

# # remove an element from the end of an array
# last_element = array_1.pop #["!", "Bye", "Wazzup"]


# numbers = [0,1,2,3,5,6,7,8,9]
# numbers.slice(1, 3) #[1, 2, 3] 
# numbers[0..5] #[0, 1, 2, 3, 5, 6]
# numbers[0...5] #[0, 1, 2, 3, 5]

# #Length of array
# numbers.length
# numbers.size
# numbers.count

# #does your array include it?
# numbers.include?(9) #true
# numbers.include?(4) #false

# #join elements in our array
# string = array_1.join(" ") #"! Bye Wazzup" 
# # string back to an array
# string.split(" ")


names = ["mac", "matt", "ikenna", "mike", "christopher", "julian", "matt",  "leonetti", "jess", "elena", "jasmine", "matt", "jessica", "mike", "mike"]


# uniq - check to see if the name is unique
# each - will iterate through each of the names
# with_index - takes in a number (any number) and starts counting from that number

names.uniq.each.with_index(1) do | individual_name, i |
    binding.pry
    puts "#{i}. #{individual_name}"
end