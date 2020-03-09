class PhotosController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_photo, only: [:destroy]

  def create
    @new_photo = @event.photos.build(photo_params)

    # Set the user to the photo
    @new_photo.user = current_user

    if @new_photo.save
      notify_about_photo(@new_photo)
      # redirect to the event with the comment
      redirect_to @event, notice: I18n.t('controllers.photos.created')
    else
      # if no - redirect with error
      render 'events/show', alert: I18n.t('controllers.photos.error')
    end
  end

  def destroy
    message = {notice: I18n.t('controllers.photos.destroyed')}

    # Checking if the user can delete photo
    if current_user_can_edit?(@photo)
      @photo.destroy
    else
      # If he cannot delete it, render error
      message = {alert: I18n.t('controllers.photos.error')}
    end

    # In any case redirect to event
    redirect_to @event, message
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  # Taking the photo from the DB
  def set_photo
    @photo = @event.photos.find(params[:id])
  end

  def notify_about_photo(photo)
    all_emails = (@event.subscriptions.map(&:user_email) +
      [@event.user.email] - [photo.user.email]).uniq

    all_emails.each do |mail|
      EventMailer.photo(@event, photo, mail).deliver_later
    end
  end

  # while creating new photo we are taking the array of parameters photo
  # with the only value photo
  def photo_params
    params.fetch(:photo, {}).permit(:photo)
  end
end