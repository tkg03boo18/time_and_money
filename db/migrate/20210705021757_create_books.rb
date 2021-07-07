class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :introduction
      t.date :date
      t.string :amount
      t.integer :payment_method, default: 0

      t.timestamps
    end
  end
end
