class ClientMailer < BookingMailer

  def thank_you_notification(options)
    mail_boilerplate(options, :thank_you,  self)
  end

  def can_load_header?
    File.exists?(ambassador_header_template_path)
  end

  def header_partial
    "#{mailer_path}/#{ambassor_header_title}"
  end

  def ambassor_header_title
  "#{@source_id}_header_title"
  end

  def mailer_path
    "app/views/client_mailer/fr"
  end

  def ambassador_header_template_path
    "#{mailer_path}/_#{ambassor_header_title}.html.haml"
  end

  def other_ambassadors
    @other_ambassadors ||= Ambassador.load_random_expect(@source_id)
  end


end 
