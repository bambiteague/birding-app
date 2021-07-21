class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save         
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @bird = Bird.find(params[:id])
  end

  def my_sightings
    @user = current_user
    @user_sightings = @user.sightings
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
