###########  NOTE: No starting code because you start a new application for this study group with the Corneal Gem.

# Instantiate a new sinatra app, run through all the setup stuff, talk about all the app things

# Add in a rake console

```ruby
desc "rake console"
task :console do
    Pry.start
end
```



# What are the four basic http routes? 
  GET, POST, DELETE, PUT/PATCH

  

# 1. start simple in app.rb 
  get '/' do 
    "Hello world!"
  end

# 2. routefile gets too large! can create new files, read them in from the class. create home.html file, hello.html file. Then in app.rb, change code to:

  get '/' do 
    File.read("../app/views/home.html")
  end

  get '/students' do
    File.read("hello.html")
  end

# 3. if we keep everything in one routefile, it gets giant. Make another one that can inherit from App. Create parents.html as well. 

  class Parent < App
    get '/parents' do 
      File.read("parents.html")
    end
  end
  # go to route in browser, show error. 

  # start renaming things - App goes to applicationController, Parents goes to ParentsController.
  # in config.ru, run ApplicationController, use ParentsController
  # in environment file, req_rel application_controller, parents_controller
  # rename files where appropriate
  # restart shotgun server

# 4. define ChildrenController, children.html, mount, require in environment

# 5. Now we can do embedded ruby files - erb!!!
  # change homepage to .erb. In app controller, change code to:
  get '/' do 
    erb :home
  end

  # refresh, show error
  # is looking for the view in a folder called views! lets make one.
  # move to views folder
  # now, we can pass data through instance variables
  get '/' do 
    @name = "name"
    erb :home
  end

  # in view teach about ERB tags
  <p>My name is <%= @name %></p>

# 6. talk about difference between <% and <%=
  # add array of names to route
  get '/' do 
    @names = ["name1","name2", "name3", "name4", "name5" ]
    erb :home
  end

  # write loop in view
  <ul>
  <% @names.each do |name| %>
    <li><%= name %></li>
  <% end %>
  </ul>

# 7. change environment file and gemfile to require db
  # add app directory, create controller directory underneath it, add controller files to appropriate directory
  # run rake -T to check for rake tasks
  # run rake console

# 8. Create parent model in new model folder
    class Parent < ActiveRecord::Base

    end

# Possible extensions: Add in relationships, upgrade with a database connections

# environment.rb

ENV['SINATRA_ENV'] ||= 'development'
ENV['RACK_ENV'] ||= "development"
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'


# gemfile
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'sqlite3'

# rakefile

ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :console do
  Pry.start
end