class Bird < ApplicationRecord
  has_many :sightings
  has_many :users, through: :sightings

  validates :species, presence: true, uniqueness: {message: "is already listed. Please select a species from our drop down of previously recorded birds"}
  validates :quantity, presence: true, numericality: {greater_than: 0, less_than: 101}, {message: "limit of birds for a sighting is 100"}

end
