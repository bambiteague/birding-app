class SightingsController < ApplicationController

  def new
    @sighting = Sighting.find_or_create_by(sighting_params)
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
    params.require(:sighting).permit(:location, :date_spotted, :user_id, :bird_id)
  end

end
