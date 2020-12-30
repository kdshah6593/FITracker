class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|

      t.timestamps null: false
    end
  end
end
