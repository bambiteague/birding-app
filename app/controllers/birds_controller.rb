class BirdsController < ApplicationController

  def new
    @bird = Bird.new
    @bird.sightings.build
  end

  def create
    @bird = Bird.new(bird_params)
    if @bird.save
      redirect_to bird_path(@bird)
    else
      render :new
    end
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
    params.require(:bird).permit(:species, :visual_description, :call_description, :quantity, sightings_attributes: [:location, :date_spotted])
  end
  
end
