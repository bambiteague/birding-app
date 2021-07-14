class SessionsController < ApplicationController
  
  def destroy
    session.clear
    redirect_to root_path
  end

  def create
    user = Globaluser.find_by(username: params[:globaluser][:username])
    if user && user.authenticate(params[:globaluser][:password])
      session[:globaluser_id] = user.id
      redirect_to profile_path
    else
      flash[:message] = "Incorrect login information" 
      redirect_to '/login'
    end
  end

  def omniauth
    #processing the response we recieved from Google and either:
    #create a new user 
    #or 
    #log in an existing user
    user = Globaluser.from_omniauth(request.env['omniauth.auth'])
    if user.valid?
      session[:globaluser_id] = user.id
      redirect_to complete_path
    else
      redirect_to '/login'
    end
  end

end
