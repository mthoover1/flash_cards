class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  validates :response, presence: true
  validates :correctness, presence: true

  before_save :check_answer

  def check_answer
    @round = Round.find(self.round_id)
    @deck = Deck.find(@round.deck_id)

    unless @deck.id == 1
      self.correctness = 1 if self.response.downcase.gsub(".", "") == Card.find(card_id).solution.downcase.gsub(".", "")
    else
      proximity = self.response.to_i - Card.find(card_id).solution.to_i

      self.correctness = 5 if proximity == 0
      self.correctness = 3 if proximity == 1 || proximity == -1
      self.correctness = 2 if proximity == 2 || proximity == -2
      self.correctness = 1 if proximity == 3 || proximity == -3
    end
  end

  def prompt
    card = Card.find(self.card_id)
    card.prompt
  end

  def solution
    card = Card.find(self.card_id)
    card.solution
  end
end
