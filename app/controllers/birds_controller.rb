class BirdsController < ApplicationController

  def new
    @bird = Bird.find_or_create_by(bird_params)
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

  def bird_params
    params.require(:bird).permit(:species, :visual_description, :call_description, :quantity)
  end
  
end
