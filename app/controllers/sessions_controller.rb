class SessionsController < ApplicationController
  
  def destroy
    session.clear
    redirect_to root_path
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path 
    else
      flash[:message] = "Incorrect login information" 
      redirect_to '/login'
    end
  end

  def omniauth   #Omniauth is not working to log in a user with Google atm (need to fix)
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.valid?
      session[:user_id] = user.id
      redirect_to complete_path
    else
      redirect_to '/login'
    end
  end

end
