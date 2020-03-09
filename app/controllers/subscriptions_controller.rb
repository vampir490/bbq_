class SubscriptionsController < ApplicationController
  # Creating event event for subscription
  before_action :set_event, only: [:create, :destroy]

  # Create subscription to delete
  before_action :set_subscription, only: [:destroy]

  def create
    # Template for ner subscription
    @new_subscription = @event.subscriptions.build(subscription_params)
    @new_subscription.user = current_user

    if @new_subscription.save
      EventMailer.subscription(@event, @new_subscription).deliver_later
      # Redirecting events page
      redirect_to @event, notice: I18n.t('controllers.subscriptions.created')
    else
      # In case of errors - render the event
      render 'events/show', alert: I18n.t('controllers.subscriptions.error')
    end
  end

  def destroy
    message = {notice: I18n.t('controllers.subscriptions.destroyed')}
    if current_user_can_edit?(@subscription)
      @subscription.destroy
    else
      message = {alert: I18n.t('controllers.subscriptions.error')}
    end

    redirect_to @event, message
  end

  private

  # Find the subscription
  def set_subscription
    @subscription = @event.subscriptions.find(params[:id])
  end

  # Finding event
  def set_event
    @event = Event.find(params[:event_id])
  end

  # Setting permission params
  def subscription_params
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end
end
