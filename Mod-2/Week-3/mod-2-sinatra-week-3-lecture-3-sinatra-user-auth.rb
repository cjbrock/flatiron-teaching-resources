# show how to remove remote
# add in new remote

# add delete method
    # If we have :id in our route, we definitely need to find our object!

    delete '/posts/:id' do
        @post = Post.find_by_id(params[:id])
        @post.destroy
        redirect "/posts"
    end

# delete form
<h2>Would you like to delete this quote?</h2>

<form method="POST" action="/posts/<%= @post.id %>">
  <input type="hidden" id="hidden" name="_method" value="DELETE">
  <input type="submit" value="delete">
</form>

# test

# now we're going to do sessions!

# http is stateless - there is no way to remember who we are. there's no way to remember who we are. there's only one way to persist data throughout and that's by hooking in to one hash named sessions. 

# in the configure block, add:

configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "thisisthequickanddirtyway"
  end

# we'll talk about setting an environment file next week

# add pry in index method, should be able to call session in pry

in pry: session

# can hook in to this hash to be able to identify our user
# corneal comes with bcrypt built in 
# we need to add in a macro to allow us to login and salt and hash the passwords

# create migration for password_digest

# go to rake console, show user creation, save user, show salted and hashed user

# adjust seeds, drop db, reseed

# create sessions controller for auth and login, mount in config.ru

use SessionsController

# the users controller handles new accounts

class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login"
    end

end

# create sessions/login.erb
<h1>Login!</h1>

<form method="POST" action="/login">
  Email: <input type="text" name="email"/><br/>
  Password: <input type="password" name="password"/><br/>
  <input type="submit">
</form>

# create post method, talk about what goes into post method - break it out into steps
# show params
# how do we log someone in to the application?
# need to make either a name or a username unique, because we're going to need to be able to look someone up.
# we'll talk about AR validations tomorrow
post '/login' do
    #find the user
    user = User.find_by(email: params[:email])
    #check the password
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/posts"
    else
      redirect "/login"
    end
    # redirect accordingly
  end

# drop prys to show the session hash before and after authentication

# we want to be able to prevent our general public from seeing our pages without being logged in. Right now I can just navigate to /posts

# let's define a couple helper methods that are going to be available everywhere to help us

helpers do
    def logged_in?
      session[:user_id]
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end

  end

  # let's limit our index to make sure our user is logged in
  get '/posts' do 
    if logged if?
        @posts = Post.all
        erb :"posts/index"
    else
        redirect "/login"
    end
end

# we can do this for every page that we want to redirect 

# now let's make sure that we can only edit something if we own it!
get '/posts/:id/edit' do
    @users = User.all
    @post = Post.find_by_id(params[:id])
    if @post.user.id == current_user.id
        erb :"posts/edit"
    else
        redirect "/posts"
    end
end

# refactor so that we don't have the drop-down (possibly tomorrow)
# take the drop-down out, user current_user.posts.build