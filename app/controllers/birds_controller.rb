class BirdsController < ApplicationController

  def new
    @bird = Bird.new
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
