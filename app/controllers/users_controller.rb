class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash.now[:alert] = @user.errors.full_messages
            render :new
        end
    end

    def show
        if logged_in?
            @user = User.find_by(id: params[:id])
        else
            redirect_to '/'
        end
        
    end

    def signin
        @user = User.new
    end

    def loggedin
        user = User.find_by(id: params[:user_name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path user
        else
            if user
                flash[:alert] = user.errors.full_messages 
            else
                flash[:alert] = ["Username doesn't exist."]
            end
            redirect_to '/signin'
        end

    end

    def logout
        session.delete :user_id
        redirect_to root_path
    end

    private
        def user_params
            params.require(:user).permit(:name, :height, :happiness, :tickets, :nausea, :password, :admin)
        end
end

