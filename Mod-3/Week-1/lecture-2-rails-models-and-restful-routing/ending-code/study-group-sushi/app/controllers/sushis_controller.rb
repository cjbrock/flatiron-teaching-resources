class SushisController < ApplicationController
    before_action :set_sushi, only: [:show]

    def index
      @sushis = Sushi.all
    end

    def show
      if !@sushi
        redirect_to sushis_path
      end
    end

    def new
      @sushi = Sushi.new
    end

    def create
      binding.pry
    end



    private

    def set_sushi
      @sushi = Sushi.find_by_id(params[:id])
    end
end
