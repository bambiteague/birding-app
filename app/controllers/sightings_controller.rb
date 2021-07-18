class SightingsController < ApplicationController

  def new
    @sighting = Sighting.new   
    @sighting.build_bird = new_bird
    new_bird.id = params[:bird_id]
  end

  def create
   @sighting = Sighting.new(sighting_params)
  
    if @sighting.save
      redirect_to bird_sightings_path
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


#BELOW IS FROM WORK WITH A FRIEND THAT'S BEEN IN JS A LOT LATELY, NOT DRY
# def create
#   new_bird = Bird.create(sighting_params[:bird_attributes])
#   @sighting = Sighting.new({bird_id: new_bird.id, user_id: current_user.id, location: sighting_params[:location], date_spotted: sighting_params[:date_spotted]}) 
#    # ^ all this is NOT DRY and manual, instead of Rails "magic", 
#    # but the only way it works ATM >> NEEDS REFACTORING BEFORE SUBMISSION!
#   if @sighting.save
#     redirect_to bird_sightings_path
#   else
#     render :new
#   end
# end