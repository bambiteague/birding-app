class User < ApplicationRecord
  has_many :sightings
  has_many :birds, through: :sightings

  has_secure_password

  validates :username, presence: true, uniqueness: {message: "already in use"}
  validates :email, presence: {message: "is required"}, uniqueness: {message: "already in use"}
  validates :password, presence: {message: "is required"}

end
