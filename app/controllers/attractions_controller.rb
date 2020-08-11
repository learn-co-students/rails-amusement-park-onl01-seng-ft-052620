class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction) 
  end

  def show
    @attraction = current_attraction
    @ride = Ride.new
  end

  def edit
    @attraction = current_attraction
  end

  def update
    attraction = current_attraction
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def current_attraction
    Attraction.find(params[:id])
  end
end
