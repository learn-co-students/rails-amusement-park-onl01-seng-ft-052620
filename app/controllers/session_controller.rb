class SessionController < ApplicationController
  skip_before_action :online_user, only: [:new, :create]
  
  
  def new
    @user = User.new
  end

  def create
      # byebug
       user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:alert] = 'Username or pass didnt match'
      redirect_to signin_path
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
