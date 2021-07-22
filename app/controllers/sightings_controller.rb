class SightingsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index 
    if params[:bird_id] && @bird = Bird.find_by_id(params[:bird_id])
      @sightings = @bird.sightings
    else
      @sightings = Sighting.all
    end
  end

  def show
    find_sighting_by_id_params
  end

  def new
    @sighting = Sighting.new   
    @sighting.build_bird 
    @bird = Bird.find_by_id(params[:bird_id])
  end

  def create
   @sighting = current_user.sightings.new(sighting_params)
    if @sighting.save
      redirect_to bird_sightings_path(@sighting)
    else
      render :new
    end
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
    sighting = Sighting.find(params[:id])
    sighting.destroy
    redirect_to my_sightings_users_path
  end

  def most_recent
    @sighting = Sighting.most_recent_bird_sighting
  end

  private

  def sighting_params
    params.require(:sighting).permit(
      :location, 
      :date_spotted,
      :bird_id,
      :user_id,
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
