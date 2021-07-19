class User < ApplicationRecord
  has_many :sightings
  has_many :birds, through: :sightings

  has_secure_password

  validates :username, presence: {message: "is required"}, uniqueness: {message: "already in use"}
  validates :location, presence: {message: "please let us know where you'birding from"}
  validates :email, presence: {message: "is required"}, uniqueness: {message: "already in use"}
  validates :password, presence: {message: "is required"}, length: {in: 6...20, message: "keep between 6-20 characters"}

  def self.from_omniauth(response)
    User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
      u.email = response[:info][:email]
      u.name = response[:info][:name]
      u.password = SecureRandom.hex(15)
    end
  end

  def user_with_most_sightings
    self.user_with_most_sightings = User.find_by
  end

end
