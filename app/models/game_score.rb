class GameScore < ApplicationRecord
  belongs_to :user
  belongs_to :game_table, optional: true
end
