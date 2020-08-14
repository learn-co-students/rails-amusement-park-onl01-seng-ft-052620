class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :update]

    def index 
        @user = helpers.ride_user
        @attractions = Attraction.all
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

    def show 
        @user = helpers.ride_user
        # set_attraction
        # byebug
        session[:ride] = @attraction
    end

    def edit 
    end

    def update 
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    # def destroy 
    # end

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
    def set_attraction
        @attraction = Attraction.find_by(id: params[:id])
    end

end
