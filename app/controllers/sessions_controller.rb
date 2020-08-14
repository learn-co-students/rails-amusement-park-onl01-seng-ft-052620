class SessionsController < ApplicationController
    def signin 
    end

    def login
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redired_to user_path(@user)
        else
            redirect_to '/'
        end
    end

    def signout 
        session.destroy
        redirect_to '/'
    end
end
