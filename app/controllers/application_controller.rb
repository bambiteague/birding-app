class ApplicationController < ActionController::Base
  #this will give us access to these methods in our views
  helper_method :current_user, :logged_in?
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

end
