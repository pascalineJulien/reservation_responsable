class BookingMailer < ApplicationMailer

  DEFAULT_AMBASSADOR_COMPANY_IDS = [479,1997,145, 165]
  ambassador_company_id
  def thank_you_email(options)      
    @options = options
    @counter = compute_counter
    @ambassador_company_name = compute_company_name
    @action = action
    @ambassador = compute_ambassador_name
    @ambassador_company_id ||= compute_ambassador_id
    @partial_header ||= partial_header
    I18n.with_locale(get_locale) do 
      subject = get_subject
      to = get_to_address
      reply_to = get_reply_to_address
      from = get_from_address
      bcc = get_bcc_address
      cc = get_cc_address

      message = mail(
        to: to,
        cc: cc,
        bcc: bcc,
        reply_to: reply_to,
        subject: subject,
        from: from
      )

      message
    end
  end

  def compute_other_ambassador_company_ids
    DEFAULT_AMBASSADOR_COMPANY_IDS.select{|id| id != @ambassador_company_id }
  end

  def testimony(company_id)
    "#{company_id}_thank_you_testimony"
  end

  def can_render_testimony
    File.exists?("app/view/booking_mailer/_#{company_id}_thank_you_testimony")
  end
 

  def compute_ambassador_name
    "Sébastien Bras"
  end

  def compute_company_name
    "Bras"  
  end

  def compute_ambassador_id
    479
  end

  def action
    @action ||= "thank_you"
  end

  def partial_header
    "#{@ambassador_company_id}_#{action}_header"
  end

  def get_reply_to_address
    nil
  end
  def get_subject
    "Thank you"
    #I18n.t("mailer.#{action}.subject", restaurant_name: @restaurant_name)
  end

  def get_locale
    @options.has_key?(:user_locale) ? @options[:user_locale] : I18n.locale
  end

  def compute_restaurant_name
    @options.has_key?(:restaurant_name) ? @options[:restaurant_name] : ""
  end
  

  def compute_counter
    @options.has_key?(:counter) ? @options[:counter] : nil
  end

  
  def get_from_address
    @options.has_key?(:from) ? @options[:from] : Rails.configuration.client_email_sender
  end

  def get_to_address
     @options.has_key?(:to) ? @options[:to] : "to@test.com"
  end

  def get_cc_address
    nil
  end

  def get_bcc_address
    nil
  end
end
