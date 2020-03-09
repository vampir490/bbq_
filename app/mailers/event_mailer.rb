class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: "#{I18n.t("event_mailer.subscription.new_subscriber")} \"#{event.title}\""
  end

  # Mail in case of new comment
  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: "#{I18n.t("event_mailer.comment.new_comment")} \"#{event.title}\""
  end

  # Mail in case of new photo
  def photo(event, photo, email)
    @event = event
    @photo = photo

    mail to: email, subject: "#{I18n.t("event_mailer.photo.new_photo")} \"#{event.title}\""
  end
end
