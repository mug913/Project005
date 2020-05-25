class GameScore < ApplicationRecord
  belongs_to :user
  belongs_to :game_table

  validates :score, :score_date, presence: true
  validates_inclusion_of :score, :in => 1..99999999999, :message => "Please enter a valid score."

  scope :desc_date, -> { order(score_date: :desc) }
  scope :fav_table, -> { group('game_table_id').order('count(*) desc').limit(1).pluck(:game_table_id).first }
  scope :topuser, -> { group('user_id').order('count(*) desc').limit(1).pluck(:user_id).first }

  def self.search(search)
    if search != "All"
      table = GameTable.find_by(name: search)
      if table
        self.where(game_table_id: table)
      else
        self.all
      end
    else
      self.all
    end
  end

end
