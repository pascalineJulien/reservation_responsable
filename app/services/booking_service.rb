class BookingService

  def notify_confirmation(confirmation_params)
    mailer = ClientMailer.thank_you_notification(compute_thank_you_options(confirmation_params.with_indifferent_access))
    mailer.deliver if mailer.present?
  end
end
