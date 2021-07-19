class Sighting < ApplicationRecord
  belongs_to :bird
  belongs_to :user
  
  accepts_nested_attributes_for :bird

  validates :location, presence: {message: "required to record a sighting"}
  validates :date_spotted, presence: {message: "required to record a sighting"}

  scope :sighting, -> { where(sighting: true) }

  def self.most_recent_bird_sighting
    order('created_at desc').first
  end

  scope :created_at, -> { where('created_at DESC')}
end
