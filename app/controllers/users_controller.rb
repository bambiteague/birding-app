class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save         
      session[:user_id] = @user.id
      redirect_to root_path 
    else
      render :new
    end
  end

  def self.from_omniauth(response)
    User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
      u.name = respnse[:info][:name]
      u.email = response[:info][:email]
      u.password = SecureRandom.hex(15)
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name, 
      :age, 
      :username, 
      :email, 
      :password, 
      :location
    )
  end

end
