class Event < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user

  validates :user, presence: true
  validates :title, presence: true, length: {maximum: 255}
  validates :address, presence: true
  validates :datetime, presence: true

  validate :datetime_cannot_be_in_the_past

  def datetime_cannot_be_in_the_past
    if datetime < Time.now
      errors.add(:datetime, 'в прошлом? Серьезно?')
    end
  end
end
