class List < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :date, presence: true
  validates :price, presence: true

end
