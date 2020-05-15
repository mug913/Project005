class GameScore < ApplicationRecord
  belongs_to :user
  belongs_to :game_table

  validates :score, :score_date, presence: true


  scope :desc_date, -> { order(score_date: :desc) }
  scope :fav_table, -> { group('game_table_id').order('count(*) desc').limit(1).pluck(:game_table_id).first }
end
