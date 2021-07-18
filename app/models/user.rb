class User < ApplicationRecord
  has_many :sightings
  has_many :birds, through: :sightings

  has_secure_password

  #something about my validations below messed up login / commented out for now ----->
  
      validates :username, presence: true, {message: "is required"}
      validates :username, uniqueness: true, {message: "already in use"}
      validates :location, presence: true, {message: "please let us know where you're birding from"}
      validates :email, presence: true, uniqueness: true, {message: "already in use"}
      validates :password, presence: true, {message: "is required"}
      validates :password,  length: { in: 6..20 }, {message: "keep between 6-20 characters"}

  def self.from_omniauth(response)
    User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
      u.email = response[:info][:email]
      u.first_name = response[:info][:first_name]
      u.last_name = response[:info][:last_name]
      u.password = SecureRandom.hex(15)
    end
  end

end
