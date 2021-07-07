class MainCategory < ApplicationRecord
  has_many :sub_categories, ->{ order(:id) }
end
