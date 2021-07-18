class SightingsController < ApplicationController

  def new
    @sighting = Sighting.new   
    @sighting.build_bird 
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
   find_sighting_by_id_params
  end

  def edit
   find_sighting_by_id_params
  end

  def update
   find_sighting_by_id_params
   @sighting.update(sighting_params)
   if @sighting.valid?
    redirect_to sighting_path
   else
    render :edit
   end
  end

  def destroy
    find_sighting_by_id_params
    @sighting.destroy
  end

  private

  def sighting_params
    params.require(:sighting).permit(
      :location, 
      :date_spotted,
      :bird_id,
      bird_attributes: [
        :species, 
        :visual_description, 
        :call_description, 
        :quantity
      ]
    )
  end

  def find_sighting_by_id_params
    @sighting = Sighting.find(params[:id])
  end
end
