class CreateGameTables < ActiveRecord::Migration[6.0]
  def change
    create_table :game_tables do |t|
      t.string :name
      t.integer :year

      t.timestamps
    end
  end
end
