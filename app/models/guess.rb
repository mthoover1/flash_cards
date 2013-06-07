class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  validates :response, presence: true
  validates :correctness, presence: true
end
