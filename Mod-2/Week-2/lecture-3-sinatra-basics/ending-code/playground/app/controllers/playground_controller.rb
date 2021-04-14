class PlaygroundController < ApplicationController


    get "/home" do 
        @best_playground = "Massena Playground"
        @awesome_playgrounds = ["Massena Playground", "Potsdam", "Plattsburg", "Ogdensburg", "Lake Placid", "Saranac Lake"]
        erb :home
    end


    #Index, Show, New, Create, Edit, Update, Delete


end