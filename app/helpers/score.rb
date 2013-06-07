def score
  correct = self.sum("correctness")   # OR self.guesses.where(correctness: 1).count
  
  if self.deck_id == 1
    total = self.guesses.count * 5
  else
    total = self.guesses.count
  end

  (correct.to_f / total.to_f).round(1)
end
