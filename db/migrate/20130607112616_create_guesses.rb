class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :round_id
      t.integer :card_id
      t.string  :response
      t.integer :correctness
      t.timestamps
    end
  end
end
