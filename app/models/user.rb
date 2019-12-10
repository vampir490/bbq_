class User < ApplicationRecord

  has_many :events

  validates :name, presence: true, length: {maximum: 35}
  validates :email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

end
