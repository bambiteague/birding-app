class SightingsController < ApplicationController

  def new
    @sighting = Sighting.new
    @sighting.build_bird
  end

  def create
    @sighting = Sighting.new(sighting_params)
    if @sighting.save
      redirect_to sightings_path(@sighting)
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def sighting_params
    params.require(:sightings).permit(:location, :date_spotted, :user_id, :bird_id)
  end

end
