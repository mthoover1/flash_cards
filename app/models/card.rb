class Card < ActiveRecord::Base
  belongs_to :deck
  validates :prompt, :presence => true
  validates :solution, :presence => true
  validates :deck_id, :presence => true
end
