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

  def index
      @user = current_user
      @user_sightings = @user.sightings
  end

  def show
      @user = current_user
  end

  def edit
    @sighting = Sighting.find(params[:id])
    @sighting_to_edit = @sighting.bird_id
  end

  def update
    @sighting = Sighting.find(params[:id])
    @sighting.update(sighting_params)
    if @sighting.valid?
     redirect_to sighting_path
    else
     render :edit
    end
  end

  def destroy
    @sighting = Sighting.find(params[:id])
    @sighting.destroy
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

  def sighting_params
    params.require(:sighting).permit(
      :location, 
      :date_spotted,
      :bird_id,
      bird_attributes: [
        :species, 
        :visual_description, 
        :call_description, 
        :quantity
      ]
    )
  end

end
