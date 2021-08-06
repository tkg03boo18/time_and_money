class Book < ApplicationRecord

  belongs_to :user
  belongs_to :main_category
  belongs_to :sub_category


  validates :date, presence: true
  validates :amount, presence: true

end
