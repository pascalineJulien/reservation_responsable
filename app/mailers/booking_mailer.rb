class BookingMailer < ApplicationMailer

 KNOWN_LOCALE = [:fr,:en]

  def mail_boilerplate(options, action, mailer=self)
    @mailer = mailer
    @mailer_name = mailer.class.name.underscore 
    @options = options
    @action = action
    @source_id ||= load_source_id
    @ambassador ||= load_ambassador
    message = I18n.with_locale(user_locale) do 
      message = mail(
        to: to_addr,
        subject: get_subject,
        from: from_addr,
        css: :email_boilerplate
      )
    end
    message
  end

  def to_addr
    @to_addr ||= load_to_addr
  end

  def load_to_addr
    "to@toto.com" #self.options[:to]
  end

  def can_select_template_as_other_ambassador?(other_ambassador_id)
    File.exists?(load_ambassador_template_path(other_ambassador_id))
  end


  def ambassador_template_path
    @ambassador_template ||= load_ambassador_template_path
  end

  def platform_locale
    KNOWN_LOCALE.include?(user_locale) ? user_locale : :en
  end


  def counter
    @counter ||= load_counter
  end

  def load_counter
    @options[:counter]
  end

  def load_source_id
    1544 || @options[:source_id]
  end

  def load_ambassador
    Ambassador.where(source_id: @source_id).try(&:first)
  end

  def from_addr
    @from_addr ||= load_from_addr
  end

  def load_from_addr
    @options[:from_addr] || Rails.configuration.client_email_sender
  end

  def load_other_ambassador_template_paths
    the_choosen_ones = []
    need_to_continue = other_company_ids.count > 0
    the_choosen_ones
  end

  def company_name
    @company_name ||= compute_company_name
  end

  def compute_company_name
    ambassador.company_name
  end

  def ambassador_id
    @ambassador_id ||= compute_ambassador_id
  end

  def get_subject
    "Thank you"
    #I18n.t("mailer.#{action}.subject", restaurant_name: @restaurant_name)
  end

  def user_locale
    @user_locale ||= get_locale
  end

  def get_locale
    @options.has_key?(:user_locale) ? @options[:user_locale] : I18n.locale
  end

  def can_load_header?
    false
  end
end
