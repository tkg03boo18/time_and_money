class ChangeDatatypeAmountofBudgetPlans < ActiveRecord::Migration[5.2]
  def change
    change_column :budget_plans, :amount, :integer
  end
end
