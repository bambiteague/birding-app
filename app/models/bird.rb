class Bird < ApplicationRecord
  has_many :sightings
  has_many :users, through: :sightings
  accepts_nested_attributes_for :sightings
    # gives us sightings_attributes= & sightings_attributes

end
