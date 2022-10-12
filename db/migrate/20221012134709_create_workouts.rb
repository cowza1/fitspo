class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.date :date
      t.string :activity
      t.integer :length
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
