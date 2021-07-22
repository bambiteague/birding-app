class SessionsController < ApplicationController
  
  def destroy
    session.clear
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/login'
    end
  end

  def omniauth 
   user = User.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
      u.email = auth["info"]["email"]
      u.username = auth["info"]["email"]
      u.password = SecureRandom.hex(15)
    end
        #checking that they register successful
    if user.valid?
      session["user_id"] = user.id #then log them in
      redirect_to user_path(user)
    else
      flash[:message] = "Oops, something went wrong!"
      redirect_to '/login'
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
