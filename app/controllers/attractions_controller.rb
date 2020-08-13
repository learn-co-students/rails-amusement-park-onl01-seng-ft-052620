class AttractionsController < ApplicationController

  before_action :require_login
  before_action :set_attraction, only: [:show,:edit,:update,:ride]

  def index
    @attractions = Attraction.all
  end

  def show
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @attraction && @attraction.update(attraction_params)
      redirect_to @attraction
    else
      render :edit
    end
  end

  def ride
    ride = Ride.new(attraction:@attraction,user:current_user)
    flash[:alert] = ride.take_ride
    redirect_to current_user
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name,:min_height,:tickets,:nausea_rating,:happiness_rating)
  end

end
