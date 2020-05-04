class GameTable < ApplicationRecord

    has_many :game_scores
    has_many :users, through: :game_scores

end
