class AttractionsController < ApplicationController


def index
    @user = helpers.ride_user
    @attractions = Attraction.all
end

def show
    @user = helpers.ride_user
    @attraction = Attraction.find_by_id(params[:id])
    session[:ride] = @attraction
end

def new
    @attraction = Attraction.new
end

def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
        redirect_to attraction_path(@attraction)
    else
        render :new
    end
end

def edit    
    @attraction = Attraction.find_by_id(params[:id])
end

def update
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
end

private
def attraction_params
    params.require(:attraction).permit(
    :name, 
    :nausea_rating, 
    :happiness_rating,
    :tickets,
    :min_height
    )
  end


end
