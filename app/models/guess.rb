class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  validates :response, presence: true
  validates :correctness, presence: true

  before_save :check_answer

  def check_answer
    self.correctness = 1 if self.response == Card.find(card_id).solution
  end
end
