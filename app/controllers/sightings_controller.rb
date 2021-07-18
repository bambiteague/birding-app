class SightingsController < ApplicationController

  def new
    @sighting = Sighting.new
    @sighting.build_bird
    @sighting.save
  end

  def create
    @sighting = Sighting.new(sighting_params) 
    if @sighting.save!
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
  end

  def update
  end

  def destroy
  end

  private

  def sighting_params
    params.require(:sighting).permit(
      :location, 
      :date_spotted, 
      :user_id, 
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
