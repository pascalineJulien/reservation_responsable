module BookingMailerHelper
  CUSTOM_STYLE = "max-width:512px;"
  CUSTOM_WIDTH="164"
  
  def title_for_mail(title = @action)
    #I18n.t("mailer.title.#{title.to_s.gsub(/" "/, ".").downcase}")
    "thank_you"
  end

  def stylesheet_mailer
    asset_prefix = Rails.env.production? ? "/assets/" : ""
    stylesheet = "email_boilerplate"
    stylesheet
  end

  def render_booking_mail(partial, mailer_name=@action)
    render partial: "#{mailer_name}_#{partial}"
  end

  def ambassador_header_title
    render partial:  "#{@mailer_name}/fr/#{@mailer.ambassor_header_title}" 
  end
end
