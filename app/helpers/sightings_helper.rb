module SightingsHelper

  def display_index_header(bird)
    if @bird
      content_tag(:h1, "#{@bird.species} Sightings:")
    else
      content_tag(:h1, "All Recorded Sightings:")
    end 
  end

end
