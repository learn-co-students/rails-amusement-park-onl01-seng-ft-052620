class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.sorted_alphabetical
  end

  def create
    @user = User.find_by(name: user_params[:name])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id

      redirect_to @user
    else
      @users = User.sorted_alphabetical
      render :new
    end
  end

  def destroy
    session.delete :user_id

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:password)
  end

end
