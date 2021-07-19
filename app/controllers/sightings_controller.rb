class SightingsController < ApplicationController

  def index 
    # check if this request is a nested route
    if params[:bird_id] && bird = Bird.find_by_id(params[:brand_id])
    # if it is a nested route, let's only send in this bird's sightings
      bird.sightings
    else
    # otherwise, show all sightings
    @sightings = Sighting.all
    end
  end

  def show
   find_sighting_by_id_params
  end

  def new
    User.find(session[:user_id])
    @sighting = Sighting.new   
    @sighting.build_bird 
  end

  def create
   @sighting = Sighting.new(sighting_params)
  
    if @sighting.save
      redirect_to bird_sightings_path
    else
      render :new
    end
  end

  def edit
   find_sighting_by_id_params
  end

  def update
   find_sighting_by_id_params
   @sighting.update(sighting_params)
   if @sighting.valid?
    redirect_to sighting_path
   else
    render :edit
   end
  end

  def destroy
    find_sighting_by_id_params
    @sighting.destroy
  end

  private

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

  def find_sighting_by_id_params
    @sighting = Sighting.find(params[:id])
  end
end
