class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :title
      t.integer :sets
      t.integer :reps
      t.integer :distance
      t.integer :duration
      t.integer :workout_id
      t.timestamps null: false
    end
  end
end
