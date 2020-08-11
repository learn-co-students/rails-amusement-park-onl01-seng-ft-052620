class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  validates :password, presence: true, on: [:create, :save]

  def mood
    nausea > happiness ? "sad" : "happy" if nausea && happiness
  end
end
