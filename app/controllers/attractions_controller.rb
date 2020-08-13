class AttractionsController < ApplicationController

    def index 
        @attarctions = Attraction.all
        @user = current_user
    end

    def new
        @user = current_user
        #byebug
        if @user.admin
        @attraction = Attraction.new
        else 
            redirect_to attractions_path
        end
    end

    def create 
        @user = current_user
          #byebug
         if @user.admin?
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
        else 
          redirect_to attractions_path
        end
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
        @ride = Ride.new
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end
       

    def update
        attraction = Attraction.find_by(id: params[:id])
        attraction.update(attraction_params)
        redirect_to attraction_path(attraction)
    end

    def destroy
    end
private
   
def attraction_params
    params.require(:attraction).permit(
      :name,
      :min_height,
      :tickets,
      :happiness_rating,
      :nausea_ratiing
    )
  end



    
end
