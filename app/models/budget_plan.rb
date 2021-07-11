class BudgetPlan < ApplicationRecord
  belongs_to :main_category
  belongs_to :sub_category
end
