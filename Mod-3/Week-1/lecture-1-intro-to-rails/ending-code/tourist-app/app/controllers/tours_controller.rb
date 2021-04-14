class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  # GET /tours
  # GET /tours.json

  def index
    @tours = Tour.all
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      redirect_to @tour, notice: 'Tour was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
      if @tour.update(tour_params)
        redirect_to @tour, notice: 'Tour was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    redirect_to tours_url, notice: 'Tour was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tour_params
      params.require(:tour).permit(:name, :location, :activities, :cost, :start_time, :end_time, :tour_date, :full)
    end
end
