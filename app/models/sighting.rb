class Sighting < ApplicationRecord
  belongs_to :bird
  belongs_to :user
  
  accepts_nested_attributes_for :bird

  validates :location, presence: true, {message: "required to record a sighting"}
  validates :date_spotted, presence: true, {message: "required to record a sighting"}
end
