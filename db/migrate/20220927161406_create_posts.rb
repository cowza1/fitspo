class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :image
      t.text :content
      t.references :account, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
