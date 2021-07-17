class Sighting < ApplicationRecord
  belongs_to :bird
  belongs_to :user
  
  accepts_nested_attributes_for :bird
    # gives us the methods-> bird_attributes= & bird_attributes


end
