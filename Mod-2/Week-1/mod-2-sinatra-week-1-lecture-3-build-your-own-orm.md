# Intro to ORMs (Object Relational Mappers)

- what does an ORM do?
- Maps rows and tables in a DB to objects that we can play with in our code
- Why do we want this?
  - makes our data retrieval much easier
  - abstraction makes our code less repetitive


# 2. Run through classes, first tweet, then tweets app 
# 3. run code - ruby bin/rub.rb
# 4. close app with control c, then re-run, show that we start back at 1
# talk about database connection, where we are connecting to the DB, how we're returning the results
# in dbBrowser, create table

CREATE TABLE tweets(id INTEGER PRIMARY KEY AUTOINCREMENT, username VARCHAR(255), message VARCHAR(140))
# 5. Show DB structure, add tweet data into db
INSERT INTO tweets (username, message) VALUES ("username", "message")
#talk about DBBrowser locking your DB!
# show environment file
# 6. write a SQL query to grab all the tweets from the DB in the self.all method in the Tweet class
# add pry after

  def self.all
    @@all
    results = DB[:conn].execute('SELECT * FROM tweets')
    binding.pry
  end
# 7. run code - ruby bin/rub.rb
# 8. Now we have a hash of tweets, but need to convert to instances
def self.all
  @@all
  results = DB[:conn].execute('SELECT * FROM tweets')
  results.map{|tweet| Tweet.new (tweet)}
  binding.pry
end

#  9. also need to add an ID property, add an attr_reader, and add to initialize

attr_reader :id

def initialize(props={})
  @id = props['id']
  @message = props['message']
  @username = props['username']
end

# 10. now we don't need our ALL array, because it's empty! It's a direct call to the DB. Remove it from the method, and remove the class variable.

# 11. Now we need to save it to the database! Add tweet.save to our tweets_app.rb call method. That will kick off saving our tweet to our db.

class TweetsApp
  def call
    while true
      puts 'Welcome to Twitter'
      puts 'Enter a username:'
      username = gets.chomp
      puts 'Enter a message:'
      message = gets.chomp
      tweet = Tweet.new({
        'username' => username,
        'message' => message
      })
      tweet.save
      tweets = Tweet.all
      render(tweets)
    end
  end

# 12. Let's define that method in tweet.rb
def save
  sql = "INSERT INTO tweets(username, message) VALUES(?, ?);"
  DB[:conn].execute(sql, self.username, self.message)
end

# 13. what about if we wanted to update our tweet? what happens now? Show in pry that it doesn't update - it creates a new one. Let's adjust our save method.
def save
  if self.id
    sql = "UPDATE tweets SET username = ?, message = ? WHERE id = ?"
    DB[:conn].execute(sql, self.username, self.message, self.id)
  else
    sql = "INSERT INTO tweets(username, message) VALUES(?, ?);"
    DB[:conn].execute(sql, self.username, self.message)
  end
end

#  14. Check the tweet creation in rake console
# Tweet.all.first
#  Tweet creation needs the keys as strings and hash rockets

# 15. We need a delete now!
def delete
  DB[:conn].execute("DELETE FROM tweets WHERE id=?", self.id)
end

# 16. How about find by id? We want it to return to us the first tweet that matches the ID given, so create a new tweet and pass the result into it.
def self.find_by_id(id)
  sql="SELECT * FROM tweets WHERE id=?"
  result = DB[:conn].execute(sql, id).first
  self.new(result)
end

# 17. how about a find by user?
def self.find_by_username(username)
  sql = "SELECT * FROM tweets WHERE username = ?"
  results = DB[:conn].execute(sql, username)
  results.map {| tweet | self.new(tweet)}
end
# can abstract it further and just do a find_by, and just pass in by property 





# # CRUD REVIEW

# A tweet belongs to a user and has some message content - must have user_id

# The belongs_to must have a user_id on it

# A user has a username, and has many tweets

# A tweet can have many tags and a tag can have many tweets
