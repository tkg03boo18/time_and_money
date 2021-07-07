class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :name
      t.date :date
      t.string :price
      t.boolean :purchased, default: false, null: false

      t.timestamps
    end
  end
end
