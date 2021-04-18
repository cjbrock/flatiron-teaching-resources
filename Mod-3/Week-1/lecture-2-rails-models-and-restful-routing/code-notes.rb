# We're starting with a copy of a basic rails application where we're going to be making sushi this mod! 

# Run through app, get everyone oriented, run through the restful route table, talk about the routes you're going to be building for this application

# | HTTP VERB  | Route           | Action        |
# | GET        | /sushis         | sushis#index  |
# | GET        | /sushis/:id     | sushis#show   |
# | GET        | /sushi/new      | sushis#new     |
# | POST       | /sushis         | sushis#create  |

# Migrate the database, run the seeds, run the server, show the initial state of the app

# Talk about whether to write the controller or the routes first
# Usually I write my routes first
# Order matters in the routefile - just like in the sinatra routefile
# write the routes manually first
# write the index route

#index

get '/sushis', to: "sushis#index"

# look at /rails/info/routes in the controller, show new route existing!

# write controller method, add pry, talk about differences between sinatra and rails (need to add pry to gemfile)

class SushisController < ApplicationController
    def index
        binding.pry
    end

end

# finish out index
class SushisController < ApplicationController
    def index
        @sushis = Sushi.all
    end
end

# add loop to the index template

#<% # @sushis.each do | sushi | %>
    #<li><%= sushi.name %></li>
#<%end %>

# now write the show page code (route, controller, view)

 #show
 get '/sushis/:id', to: "sushis#show", as: "sushi"

#  What does the alias do?
# Does this need to be private? What does private mean? Can show a before filter here

class SushisController < ApplicationController
    before_action :set_sushi, only: [:show]
    def show
        if !@sushi
        redirect_to sushis_path
        end
    end
    private

    def set_sushi
      @sushi = Sushi.find_by_id(params[:id])
    end
end

# All they want you to add to the show page is this:
 #<%= @sushi.name %>

# Now we can do forms!

def new
    @sushi = Sushi.new
  end

  #new
  get '/sushis/new', to: "sushis#new", as: "new_sushis"  

# The curriculum is a bit older and all they show is form_tag and form_for. I usually also teach form_with, as both form_tag and form_for are going to be deprecated. I show all three. Mostly because you don't know what they're going to be walking in to, and they're going to need to know that:
# - form_tag takes a url
# - form_for takes an object
# - form_with does both, and it's really a lot easier
#  ALL THESE FORM HELPERS PRODUCE HTML AT THE END OF THE DAY, AND WE NEED TO SHOW THEM THAT VIA PRY

# Usually what I'll do is build out examples in all three ways. form_tag first:

    # <%= form_tag "/sushis" do %>
    # <%= text_field_tag :name %>
    # <%= submit_tag "Create Sushi" %>
    # <% end %>

# Then form_for:

    # <%#= form_for @sushi do |f| %>
    # <%#= f.text_field :name %>
    # <%#= f.submit %>
    # <%# end %>

# Then form_with a url:
    # <%#= form_with url: "/sushis" do |f| %>
    # <%#= f.text_field :name %>
    # <%#= f.submit "Create Sushi" %>
    # <%# end %>

# Finally form_with an object: 
    # <%= form_with model: @sushi do |f| %>
    #     <%= f.text_field :name %>
    #     <%= f.submit %>
    # <% end %>

# Make sure that you're submitting the forms with pry and showing the differences in params, how things are coming in, and how the forms look in the browser 



#create

post '/sushis', to: "sushis#create"

# usually I don't get through create, that will take us into Rails CRUD study group!

def create
    binding.pry
  end






