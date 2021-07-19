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
    @bird = Bird.find_by_id(params[:bird_id])
   # Getting NilClass errors when I call any attribute on @bird object found...
  end

  private

  def bird_params
    params.require(:bird).permit(
      :species, 
      :visual_description, 
      :call_description, 
      :quantity
    )
  end
  
end


