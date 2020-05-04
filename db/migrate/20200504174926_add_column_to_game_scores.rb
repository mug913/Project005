class AddColumnToGameScores < ActiveRecord::Migration[6.0]
  def change
    add_column :game_scores, :score_date, :date
  end
end
