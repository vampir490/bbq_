class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  # Checks user_name and user_email pass,
  # only if user is not set
  # In other words for unauthorized users
  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }

  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }

  validate :user_email_cannot_be_existing_email, :subscriber_cannot_be_events_creator

  # If user exists, return  name,
  # If no – call default method
  def user_name
    if user.present?
      user.name
    else
      super
    end
  end
  # If user exists, return email,
  # If no – call default method
  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  # If unauthorized user,
  # And the email exists in DB, an error is initialized
  def user_email_cannot_be_existing_email
    if user.blank? && User.where(email: user_email).any?
      errors.add(:user_email, I18n.t('activerecord.validations.error_existing_user'))
    end
  end

  # If user is the same with the owner, an error is initialized
  def subscriber_cannot_be_events_creator
    if event.user == user
      errors.add(:user, "- #{I18n.t('activerecord.validations.error_same_user')}")
    end
  end
end

