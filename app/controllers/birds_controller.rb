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
  end

  def edit
  end

  def update
  end

  def destroy
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
