class BirdsController < ApplicationController

  def new
    @bird = Bird.new
    @bird.sightings.build
  end

  def create
    @bird = Bird.new(bird_params)
    @bird.save
  end

  def index
    @birds = Bird.all
  end

  def show
    @bird = Bird.find(params[:id])
    @species = @bird.species
  end

  private

  def bird_params
    params.require(:bird).permit(
      :species, 
      :sighting_id,
      :visual_description, 
      :call_description, 
      :quantity
    )
  end
  
end


