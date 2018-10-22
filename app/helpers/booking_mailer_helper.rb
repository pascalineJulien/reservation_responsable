module BookingMailerHelper

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
end
