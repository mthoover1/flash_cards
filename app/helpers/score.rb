def score
  if self.deck_id == 1
    weighted_score   # => User can earn points with a close guess
  else
    standard_score
  end
end


def standard_score
  correct = self.sum("correctness")   # OR self.guesses.where(correctness: 1).count
  total = self.guesses.count

  (correct.to_f / total.to_f).round(1)
end



def weighted_score
  
end
