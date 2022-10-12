class AddWeightToExercise < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :weight, :integer
  end
end
