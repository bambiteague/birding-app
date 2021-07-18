class Bird < ApplicationRecord
  has_many :sightings
  has_many :users, through: :sightings

  validates :species, uniqueness: {message: "This bird has already been found! Please select a species from our drop down full of already submitted birds."}

end
