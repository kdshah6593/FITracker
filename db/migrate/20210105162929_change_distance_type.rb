class ChangeDistanceType < ActiveRecord::Migration
  def change
    change_column :exercises, :distance, :float
  end
end
