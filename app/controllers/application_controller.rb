class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?, :is_admin?

  def require_login
    redirect_to root_path if !logged_in?
  end

  def require_admin
    redirect_to root_path if !is_admin?
  end

  def current_user
    @user ||= User.find(session[:user_id]) if logged_in?
  end

  def logged_in?
    !!session[:user_id]
  end

  def is_admin?
    current_user.admin
  end

end
