class CreateCrickets < ActiveRecord::Migration[7.0]
  def change
    create_table :crickets do |t|
      t.string :name
      t.integer :age
      t.string :country
      t.integer :role
      t.integer :matches_played
      t.integer :runs_scored
      t.integer :wickets_taken
      t.integer :highest_score
      t.string :best_bowling
      t.boolean :captain
      t.boolean :retired

      t.timestamps
    end
  end
end
