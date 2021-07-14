class ApplicationController < ActionController::Base
  #this will give us access to these methods in our views
  helper_method :current_user, :logged_in?, :redirect_if_not_logged_in

  private

  def current_user
    @current_user ||= Globaluser.find(session[:globaluser_id]) if session[:globaluser_id]
  end

  def logged_in?
    !!session[:globaluser_id]
  end

  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end

end
