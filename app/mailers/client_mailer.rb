class ClientMailer < BookingMailer

  def thank_you_notification(options)
    mail_boilerplate(options, :thank_you)
  end
end 
