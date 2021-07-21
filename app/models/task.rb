class Task < ApplicationRecord
  belongs_to :user

  enum importance: {高い: 0, 低い: 1}
  enum genre: {仕事: 0, プライベート: 1}

end
