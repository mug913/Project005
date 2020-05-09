class GameScore < ApplicationRecord
  belongs_to :user
  belongs_to :game_table

  validates :score, :score_date, presence: true
end
