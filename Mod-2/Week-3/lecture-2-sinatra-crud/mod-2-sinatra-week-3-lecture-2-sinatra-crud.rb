# Start a new application
corneal new blog_app
bundle install

# Run through the routes for post in README
# | HTTP Verb  |  Route           |  Action | 
# | GET        |  /posts          |  index  |
# | GET        |  /posts/:id      |  show   |
# | GET        |  /posts/new      |  new    |
# | POST       |  /posts          | create  |
# | GET        |  /posts/:id/edit |  edit   |
# | PUT/PATCH  |  /posts/:id      |  update |
# | DELETE     |  /posts/:id      | destroy |

# Create migrations for post
rake db:create_migration NAME=create_post

# in migration file
class CreatePost < ActiveRecord::Migration[5.2]
    def change
      create_table :posts do | t |
        t.string :title
        t.text :body
  
        t.integer :user_id
        t.timestamps
      end
    end
  end

#   create migration for user model
rake db:create_migration NAME=create_user

# in migration
class CreateUser < ActiveRecord::Migration[5.2]
    def change
      create_table :users do | t |
        t.string :name
        t.string :email
      end
    end
  end

# migrate database
rake db:migrate

# verify schema
# write your models
# create post.rb and user.rb
class Post < ActiveRecord::Base

end

class User < ActiveRecord::Base

end

# add relationships
class Post < ActiveRecord::Base
  belongs_to :user
end

class User < ActiveRecord::Base
  has_many :posts
end

# write some seed data

User.destroy_all
Post.destroy_all
5.times do
    User.create(name: Faker::Name.name, email: Faker::Internet.email)
end


15.times do 
    Post.create(title: Faker::Space.agency, body: Faker::Movies::StarWars.quote, user: User.all.sample)
end

puts "seeds planted :-)"


# Build controllers
class PostsController < ApplicationController
    
end

class UsersController < ApplicationController
    
end

# Register them in config.ru
use PostsController
use UsersController

# build index route in postController

get '/posts' do
  @posts = Post.all
  erb :'posts/index'
end

# build posts view - create posts folder and index file and write code

<h1>Here are all of your posts</h1>

<ul>

<% @posts.each do |post| %>

  <li><%= post.title %></a></li>

<% end %>

</ul>


# build show route and view

# Posts controller
get '/posts/:id' do
  @post = Post.find_by_id(params[:id])
  erb :"posts/show"
end

# posts/show.erb

<h1><%= @post.title%></h1>
<p><%= @post.body%></p>


# edit link
#delete form

<a href="/posts">Back to the index</a>

# Add in link to the show page on the index page for navigation purposes - make your life easier!

# posts/index.erb
<h1>Here are all of your posts</h1>

<ul>

<% @posts.each do |post| %>

  <li><a href="/posts/<%=post.id%>">    <%= post.title %></a></li>

<% end %>

</ul>

# now build your new route with the form - remember to put it above your show route because specificity!

# posts_controller.rb
get '/posts/new' do
  @users = User.all
  erb :"posts/new"
end
# Why do we need our users? Going to use a drop-down box for now, but once we do user authentication we're going to be able to use a helper method called current_user to help us tell not only who is logged_in, but who is using the form to create the post

# <h1>What do you want to talk about today?</h1>

#   <form method="POST" action="/posts">
#       <select name="user_id">
#           <% @users.each do | user |%>
#               <option value="<%= user.id %>"><%= user.name %></option>
#           <% end %>
#       </select><br />
  
  
#       Title: <input type="text" name="title"><br />
#       Post: <textarea name="body"></textarea><br />
#       <input type="submit">
#   </form>

# Finish up with your create method
post '/posts' do
  post = Post.new(params)
  if post.save
      redirect "/posts/#{post.id}"
  else
      redirect "posts/new"
  end
end


# Now write your edit route
get '/posts/:id/edit' do
  @users = User.all
  @post = Post.find_by_id(params[:id])
  erb :"posts/edit"
end



# Our edit form is similar to the new form, so we can start with that syntax
# create edit view, copy/paste new form in there

# <h1>What do you want to talk about today?</h1>

#   <form method="POST" action="/posts">
#       <select name="user_id">
#           <% @users.each do | user |%>
#               <option value="<%= user.id %>"><%= user.name %></option>
#           <% end %>
#       </select><br />
  
  
#       Title: <input type="text" name="title"><br />
#       Post: <textarea name="body"></textarea><br />
#       <input type="submit">
#   </form>

# We'll also need to add our rack method override in our config.ru. If we don't have that, we won't be able to actually use the patch method in the Sinatra framework, and you'll be *really* confused as to why you're just creating new objects, instead of editing the ones you have. 

# config.ru
Rack::MethodOverride

# in our edit form, we need to make some adjustments to make it an edit form. We need to adjust the route to actually make it an edit form, and add a hidden input to tell it to send it as a Patch instead of just a post. Other than that, this is pretty good to go. 

# <h1>Edit your post!</h1>

# <form method="POST" action="/posts/<%= @post.id %>">
#     <input type="hidden" id="hidden" name="_method" value="PATCH">
#     <select name="user_id">
#         <% @users.each do | user |%>
#             <option value="<%= user.id %>"><%= user.name %></option>
#         <% end %>
#     </select><br />


#     Title: <input type="text" name="title"><br />
#     Post: <textarea name="body"></textarea><br />
#     <input type="submit">

# </form>

# This works, but it would be awesome to see what our existing values of these fields are in the fields are, right? let's fix that. Talk about the difference between textarea and input, and how you can't call value for textarea but can for input, and how input is self closing but textarea isn't. LOTS of info to communicate here. 

# <h1>Edit your post!</h1>

# <form method="POST" action="/posts/<%= @post.id %>">
#     <input type="hidden" id="hidden" name="_method" value="PATCH">
#     <select name="user_id">
#         <% @users.each do | user |%>
#             <option value="<%= user.id %>"><%= user.name %></option>
#         <% end %>
#     </select><br />


#     Title: <input type="text" name="title" value="<%=@post.title%>"><br />
#     Post: <input name="body" value="<%=@post.body%>"><br />
#     <input type="submit">

# </form>

# Now, let's define the update action in the controller!

patch '/posts/:id' do
  binding.pry
  @post = Post.find_by_id(params[:id])
  if @post.update(params)
      redirect "/posts/#{@post.id}"
  else
      redirect "posts/new"
  end
end


# Ok, so we might not be able to mass assign the params for update? But THAT totally bites. So, let's delete that weird patch param? Look at it in pry. 

params.delete("_method")

# full method looks like 
patch '/posts/:id' do
  binding.pry
  @post = Post.find_by_id(params[:id])
  params.delete("_method")
  if @post.update(params)
      redirect "/posts/#{@post.id}"
  else
      redirect "posts/new"
  end
end


# I usually run over here, so I usually don't end up have time for delete here. BUT here it is: 

delete '/posts/:id' do
  @post = Post.find_by_id(params[:id])
  @post.destroy
  redirect "/posts"
end

# and usually I'll embed it on a show page:

<h2>Would you like to delete this quote?</h2>
<form method="POST" action="/posts/<%= @post.id %>">
  <input type="hidden" id="hidden" name="_method" value="DELETE">
  <input type="submit" value="delete">
</form>