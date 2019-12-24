class Event < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user

  validates :title, presence: true, length: {maximum: 255}
  validates :address, presence: true
  validates :datetime, presence: true

  validates :datetime, inclusion: { in: Time.now..,
                                    message: I18n.t('activerecord.validations.error_event_in_past') }

  #def datetime_cannot_be_in_the_past
  #  if datetime < Time.now
  #    errors.add(:datetime, I18n.t(activerecord.validations.error_event_in_past))
  #  end
  #end
end
