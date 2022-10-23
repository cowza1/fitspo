class CreateBios < ActiveRecord::Migration[7.0]
  def change
    create_table :bios do |t|
      t.text :content
      t.string :goal
      t.string :body_type
      t.string :hobbies
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
