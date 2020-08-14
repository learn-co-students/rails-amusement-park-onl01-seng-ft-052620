class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show 
        @user = User.find_by(id: params[:id])
        if session[:user_id] != @user.id 
            redirect_to '/'
        end
    end
    
    def edit 
    end
    
    def update 
    end

    def destroy 
    end

    def show_post_ride
        @attraction = Attraction.find_by_id(session[:ride]["id"])
        @user = helpers.ride_user
        session.destroy
        session[:user_id] = @user.id
        if @user.tickets >= @attraction.tickets && @user.height >= @attraction.min_height
        helpers.adjust_user(@user)
        flash[:notice] = "Thanks for riding the #{@attraction.name}!"
        render :show
        elsif @user.tickets < @attraction.tickets && @user.height< @attraction.min_height
          flash[:notice] ="You are not tall enough to ride the #{@attraction.name}"
          flash[:notice] +="& You do not have enough tickets to ride the #{@attraction.name}"
            redirect_to user_path(@user) 
        elsif @user.height < @attraction.min_height
        flash[:notice] = "You are not tall enough to ride the #{@attraction.name}"
        redirect_to user_path(@user) 
        elsif @user.tickets < @attraction.tickets
          flash[:notice] ="You do not have enough tickets to ride the #{@attraction.name}"
          redirect_to user_path(@user)
        
        end
    end

    private
    def user_params 
        params.require(:user).permit(
            :name, 
            :nausea, 
            :happiness, 
            :tickets, 
            :height, 
            :admin, 
            :password)
    end
end
