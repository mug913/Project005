class CreateGameScores < ActiveRecord::Migration[6.0]
  def change
    create_table :game_scores do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :game_table, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
