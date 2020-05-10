class GameTable < ApplicationRecord

    has_many :game_scores
    has_many :users, through: :game_scores

    accepts_nested_attributes_for :game_scores
end
