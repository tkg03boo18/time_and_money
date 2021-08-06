class BudgetPlan < ApplicationRecord
  belongs_to :main_category
  belongs_to :sub_category

  validates :main_category_id, presence: true
  validates :sub_category_id, presence: true
  validates :date, presence: true
  validates :amount, presence: true

end
