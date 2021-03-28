# start with project page
# run through requirements
    # - grab spec file, put in project
# 1-2 go together, use corneal to spin up app - inherit from sinatra app in controller
# 3. Use multiple models (usually user model and another model)
# 4. Use at least one has_many and one belongs_to on another model
    # User has_many posts


# 8. We started this yesterday - let's finish up limiting our delete function
delete '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    if @post.user.id == current_user.id
      @post.destroy
      redirect "/posts"
    else
      redirect "/posts"
    end
end

# 6. AR Validations
# 9. Need to add validations - AR validations!
    # need to validate both our form data in the post model, and that our user data that we are creating is unique
    # talk about AR validations

    # in post: 
    validates :title, :body, presence: true

    # in user:
    validates :username, :email, presence: true
    validates :email, uniqueness: true

# 5. User accounts - sign up, sign in, sign out

    #Finish user accounts!
    # login is done
    # let's do logout 

    get '/logout' do
        session.clear
        redirect "/login"
      end

      # add link in footer
      <footer class="branding">
      <% if logged_in? %>
        <h4>Welcome <%= current_user.username %></h4>
        <h4><a href="/logout">Log Out</a></h4>
      <% end %>
      <small>&copy; 2020 <strong>Corinna Brock Moore</strong></small>
    </footer>

    # sign up
    #register UsersController
    # write get route
    get "/users/signup" do
        erb :'/users/signup'
      end

      # create erb file
      # write form
#       <h1>What's your favorite quote?</h1>

# <form method="POST" action="/users">
#   <label>Name:</label><br />
#   <input type="text" name="name"><br />

#   <label>Email:</label><br />
#   <input type="text" name="email"><br />

#   <label>Password:</label><br />
#   <input type="password" name="password"><br />

#   <input type="submit" value="Sign Up!">

# </form>

# write post route
post "/users" do
    # create user
    @user = User.new(params)
    # save user
    if @user && @user.save
      # set session id
      session[:user_id] = @user.id
      # redirect user
      redirect "/posts"
    else
      # handling if the user doesn't save
      erb :"users/signup"
    end
  end

  # challenge - show AR errors
  <% if @user && @user.errors %>
    <% @user.errors.full_messages.each do |error| %>
      <p class="error"><%=error%></p>
    <% end %>
  <% end %>

  # user helpers

  def redirect_if_not_logged_in
    if !logged_in?
      redirect "/login"
    end
  end

  def redirect_if_logged_in
    if logged_in?
      redirect "/posts"
    end
  end

  # set homepage
  get "/" do
    redirect_if_logged_in
    redirect "/login"
  end


# 7. Need to add a little more app security to our methods to limit access to all our methods

# instead of needing an if statement, we can call redirect_if_not_logged_in
# add to all get routes
