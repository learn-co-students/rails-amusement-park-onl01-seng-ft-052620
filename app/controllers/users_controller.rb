class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save 
      session[:user_id] = user.id
      redirect_to user_path(user)
    else 
      flash[:alert] = user.errors.full_messages
      render 'new'
    end
  end

  def show
    if !logged_in?
      redirect_to root_path
    else
      @user = User.find_by(id: session[:user_id])
    end
  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end
end
