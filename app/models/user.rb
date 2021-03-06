class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :plans, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :lists, dependent: :destroy
  has_many :budget_plans, dependent: :destroy

  enum job: {会社員: 0, 自営業・フリーランス: 1, 主婦・主夫: 2, 学生: 3, フリーター: 4, 無職: 5, その他: 6}
  enum area: {北海道: 0, 東北: 1, 関東: 2, 中部: 3, 近畿: 4, 中国: 5, 四国: 6, 九州: 7}

  attachment :image

  validates :name, presence: true

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
