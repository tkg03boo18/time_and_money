class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :user_id
      t.string :title
      t.text :body
      t.integer :importance
      t.integer :urgency
      t.datetime :deadline
      t.boolean :fin, default: false, null: false

      t.timestamps
    end
  end
end
