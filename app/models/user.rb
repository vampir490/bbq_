class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :comments
  has_many :subscriptions

  validates :name, presence: true, length: {maximum: 35}

  before_validation :set_name, on: :create

  # For the situations when a user signs up after creating
  # events as unauthorized user
  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  private

  # Creating default name
  def set_name
    self.name = "Comrad#{rand(777)}" if self.name.blank?
  end

  # Sets the user_id to the events with the same email
  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
      .update_all(user_id: self.id)
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
