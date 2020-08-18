class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        @user = User.find(session[:user_id])
    end

    def show
        @attraction = Attraction.find(params[:id])
        @user = User.find_by_id(session[:user_id])
    end

    def ride
        user = User.find(session[:user_id])
        attraction = Attraction.find(params[:id])
        ride = Ride.find_or_create_by(user_id: user.id, attraction_id: attraction.id)
        message = ride.take_ride
        if message == "Sorry. "
            flash[:alert] = ["Thanks for riding the #{attraction.name}!"]
        else
            flash[:alert] = [message]
        end
        redirect_to user_path(user)
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
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            render :edit
        end
    end

    private

        def attraction_params
            params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
        end
end
