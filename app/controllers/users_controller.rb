class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path  # <---need to change routing
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :username, :email, :password, :location)
  end

end
