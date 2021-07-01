class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :allday, default: false, null: false

      t.timestamps
    end
  end
end
