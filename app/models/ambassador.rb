class Ambassador < ApplicationRecord

  translates :mailer_summary, :mailer_description

  def display_name
    display = [firstname] unless firstname.blank?
    display << lastname  unless lastname.blank?
    display.join(" ")
  end

  def self.load_random_expect(source_id)
    Ambassador.limit(3).order("RAND()").where("source_id != ?", source_id)
  end

  def load_for_source_id(source_id)
    Ambassador.where("source_id = ?", source_id).first
  end
end
