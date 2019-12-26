class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @nae = subscription.user_name
    @event = event

    mail to: event.user.email, subject: "New subscription on #{event.title}"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: "New comment to #{event.title}"
  end
end
