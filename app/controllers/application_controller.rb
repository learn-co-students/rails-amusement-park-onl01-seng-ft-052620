class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :online_user
  helper_method :logged_in?
  helper_method :current_user

  def online_user
    redirect_to '/' unless logged_in?
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @user = User.find_by_id(session[:user_id])
  end
end
