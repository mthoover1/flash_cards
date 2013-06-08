class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  def score
    correct = self.guesses.sum("correctness")   # OR self.guesses.where(correctness: 1).count
    
    if self.deck_id == 1
      total = self.guesses.count * 5
    else
      total = self.guesses.count
    end

    ((correct.to_f / total.to_f) * 100).round(2)
  end
end
