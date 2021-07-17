class SightingsController < ApplicationController

  def new
    @sighting = Sighting.new(sighting_params)
  end

  def create

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
