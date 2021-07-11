class CreateBudgetPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :budget_plans do |t|
      t.integer :user_id
      t.integer :main_category_id
      t.integer :sub_category_id
      t.date :date
      t.string :amount

      t.timestamps
    end
  end
end
