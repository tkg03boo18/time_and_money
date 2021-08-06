class Task < ApplicationRecord
  belongs_to :user

  enum importance: {重要: 0, 重要でない: 1}
  enum urgency: {緊急: 0, 緊急でない: 1}

  validates :title, presence: true
  validates :importance, presence: true
  validates :urgency, presence: true
  validates :deadline, presence: true

end
