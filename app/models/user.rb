class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum job: {会社員: 0, 自営業（フリーランス含む）: 1, 主婦・主夫: 2, 学生: 3, フリーター: 4, 無職: 5, その他: 6}
  enum area: {北海道: 0, 東北: 1, 関東: 2, 中部: 3, 近畿: 4, 中国: 5, 四国: 6, 九州: 7}
end
