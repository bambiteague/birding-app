class SightingsController < ApplicationController

  def new
    @sighting = Sightings.new   
    # @sighting.build_bird   <----pretty sure this is supposed to help me where the non-DRY code is in #Create 
  end

  def create
    new_bird = Bird.create(sighting_params[:bird_attributes])
    @sighting = Sighting.new({bird_id: new_bird.id, user_id: current_user.id, location: sighting_params[:location], date_spotted: sighting_params[:date_spotted]}) 
    if @sighting.save
      redirect_to sightings_path    # ^^ all this is NOT DRY and manual, instead of Rails "magic", but the only way it works ATM ---> NEEDS REFACTORING BEFORE SUBMISSION!!!
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
    @sighting = Sighting.find(params[:id])
  end

  def update
    @sighting = Sighting.find(params[:id])
  end

  def destroy
    @sighting = Sighting.find(params[:id])
  end

  private

  def sighting_params
    params.require(:sighting).permit(
      :location, 
      :date_spotted, 
      bird_attributes: [
        :species, 
        :visual_description, 
        :call_description, 
        :quantity
      ]
    )
  end


 

end
