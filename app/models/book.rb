class Book < ApplicationRecord

  belongs_to :user
  belongs_to :main_category
  belongs_to :sub_category

  enum payment_method: {現金: 0, クレジットカード: 1, 電子マネー: 2, その他支払い方法: 3}
end
