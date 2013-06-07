class User < ActiveRecord::Base
  has_many :rounds
  has_many :guesses, :through => :rounds

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true
end
