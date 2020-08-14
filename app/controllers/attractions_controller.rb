class AttractionsController < ApplicationController

    def index 
    end
     
    def new 
        @attraction = Attraction.new
    end

    def create 
        @attraction = Attraction.new(attraction_params) 
        if attraction.save 
            redirect_to attraction_path(@attraction)
        else 
            render :new
        end
    end

    def show 
    end

    def edit 
    end

    def update 
    end

    def destroy 
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
