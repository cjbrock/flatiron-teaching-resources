
# Picking up from where we left off yesterday, need to finish out the new/create process, and build out the edit/update functionality and the delete


# Add the new_sushi alias if you haven't already

# On the index page, add a link to the show page
# This helps to drive home WHY the aliases are so helpful! show the different link_to options that you can use.

# First, show the most explicit, where you can interpolate the sushi id. THey're the most comfortable with this syntax because it feels like sinatra.

<ul>
<% @sushis.each do | sushi | %>
    <li><%= link_to sushi.name, "/sushis/#{sushi.id}" %></li>
<% end %>
</ul>


# Next, show how you can use the sushi_path helper, and pass in the sushi object

<ul>
<% @sushis.each do | sushi | %>
    <li><%= link_to sushi.name, "/sushis/#{sushi.id}" %></li>
    <li><%= link_to sushi.name, sushi_path(sushi) %></li>
<% end %>
</ul>

# Finally, show how you can literally just shove the object in there, and rails infers hey you want to go to the show page here!

<ul>
<% @sushis.each do | sushi | %>
    <li><%= link_to sushi.name, "/sushis/#{sushi.id}" %></li>
    <li><%= link_to sushi.name, sushi_path(sushi) %></li>
    <li><%= link_to sushi.name, sushi %></li>
<% end %>
</ul>


# Add link to new_sushis_path
<p><%= link_to "Create a new sushi", new_sushis_path %></p>


# Create a sushi!

# In sushi create method, add sushi new, and submit form with pry in method. Why are we getting a forbidden attributes error in pry?

def create
    @sushi = Sushi.new
    binding.pry
end

# Move the pry above the sushi, show that the params have permitted false in the params hash!

# This is how rails protects itself! By default, everything is explicitly excluded. You have to whitelist your parameters in order to be able to add them to the database. Usually we add them to our strong parameters in order to allow them to be inserted. This is explicitly telling Rails that these fields are allowed to be inserted into our database. 

# Write strong params. These also go in private!

def sushi_params
    params.require(:sushi).permit(:name)
end

# Show in pry. Show how the regular params *haven't* changes, but now our sushi_params are permitted! Our strong params are a method and can be called anything, but whatever_params are conventional. 

# Finish our create. 

def create
    binding.pry
    @sushi = Sushi.new(sushi_params)
    if @sushi.save
      redirect_to sushi_path(@sushi)
    else
      render "new"
    end
end

# Why are we rendering? How else could we redirect this? Where are we going here? 

# Add validations for name (required, uniqueness)
class Sushi < ApplicationRecord
    validates :name, uniqueness: true
    validates :name, presence: true

end

# can show combined as well if you'd like depending on the level of your crowd

class Sushi < ApplicationRecord
    validates :name, uniqueness: true, presence: true

end

# UPDATE - add the routes for edit and patch

# | HTTP VERB  | Route           | Action        |
# | GET        | /sushis         | sushis#index  |
# | GET        | /sushis/:id     | sushis#show   |
# | GET        | /sushi/new      | sushis#new    |
# | POST       | /sushis         | sushis#create |
# | GET        | /sushis/:id/edit| sushis#edit   |
# | PATCH      | /sushis/:id     | sushis#update |

# write routes for edit and patch

 # edit
 get '/sushis/:id/edit', to: "sushis#edit", as: "edit_sushi"

 #update
 patch '/sushis/:id', to: "sushis#update"

#  In controller, write edit and update

  def edit
  end

  def update

  end

#   Add edit and update to before filter
before_action :set_sushi, only: [:show, :edit, :update]

# Add pry to update
def update
    binding.pry
end

# Add code to edit
def edit
    if !@sushi
      redirect_to sushis_path
    end
end

# Now we need to make the form for update! We can steal a LOT of this from our new form

            # <%= form_with model: @sushi do |f| %>
            #     <%= f.text_field :name %>
            #     <%= f.submit %>
            # <% end %> 

# We're going to want to fill in the values, and we're not going to need any hidden fields or methods like we do in sinatra! This isn't the most dry method of writing our code though - we're literally duplicating the EXACT SAME FORM on two different pages. We'll look at partials next week. 

# Let's submit this and see what happens!

# Look at params in pry
# Write controller logic - grab it from new and adjust
# make sure to annotate
# what if the name of the sushi already exists?
def update
    if @sushi
      @sushi.update(sushi_params)
      if @sushi.errors.any?
        render "edit"
      else
        redirect_to @sushi
      end
    else
      render "edit"
    end
  end


#   DESTROY - finish table!

# | HTTP VERB  | Route           | Action        |
# | GET        | /sushis         | sushis#index  |
# | GET        | /sushis/:id     | sushis#show   |
# | GET        | /sushi/new      | sushis#new    |
# | POST       | /sushis         | sushis#create |
# | GET        | /sushis/:id/edit| sushis#edit   |
# | PATCH      | /sushis/:id     | sushis#update |
# | DELETE     | /sushis/:id     | sushis#destroy|

# Write the route 
 # delete

 delete '/sushis/:id', to: "sushis#destroy"

#  Add destroy to the before filter
before_action :set_sushi, only: [:show, :edit, :update, :destroy]

# write controller action

def destroy
    @sushi.destroy
    redirect_to sushis_path
end

# Add link in show page!
<h6><%= link_to("Delete your sushi", @sushi, method: :delete, data:{confirm: "Do you really want to delete me?"}) %></h6>

# test!

# SHINY STUFF

# add edit link in show page
<h6><%= link_to "Edit your sushi", edit_sushi_path(@sushi) %></h6>

# make sure the alias is there

# show resources in routefile - make sure you update the aliases if they are different!

