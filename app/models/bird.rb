class Bird < ApplicationRecord
  has_many :sightings
  has_many :users, through: :sightings

  validates :species, presence: {message: "is required"}, uniqueness: {message: "is already listed in our collection"}
  validates :quantity, presence: {message: "is required"}, numericality: {greater_than: 0, less_than: 101, message: "limit of birds for a sighting is 100"}

end
