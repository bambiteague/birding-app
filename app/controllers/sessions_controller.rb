class SessionsController < ApplicationController
  
  def destroy
    session.clear
    redirect_to root_path
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to profile_path  # <---this is wrong (from old project/need to fix)
    else
      flash[:message] = "Incorrect login information" 
      redirect_to '/login'
    end
  end

  def omniauth
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.valid?
      session[:user_id] = user.id
      redirect_to complete_path
    else
      redirect_to '/login'
    end
  end

end
