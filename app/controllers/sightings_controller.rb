class SightingsController < ApplicationController

  def new
    @sighting = current_user.sightings.new  #something I'm trying out, doesn't seem to change the issue
    @sighting.build_bird
  end

  def create
    new_bird = Bird.create(sighting_params[:bird_attributes])
    @sighting = Sighting.new(sighting_params) 
    byebug
    if @sighting.save
      redirect_to sightings_path
    else
      render :new
    end
  end

  def index
    @sightings = Sighting.all
  end

  def show
    @sighting = Sighting.find(params[:id])
  end

  def edit
    @sighting = Sighting.find(params[:id])
  end

  def update
    @sighting = Sighting.find(params[:id])
  end

  def destroy
    @sighting = Sighting.find(params[:id])
  end

  private

  def sighting_params
    params.require(:sighting).permit(
      :location, 
      :date_spotted, 
      user_id: [], 
      bird_id: [], 
      bird_attributes: [
        :species, 
        :visual_description, 
        :call_description, 
        :quantity
      ]
    )
  end


 

end
