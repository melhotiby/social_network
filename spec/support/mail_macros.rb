module MailerMacros
  def last_email
    ActionMailer::Base.deliveries.last
  end

  def first_email
    ActionMailer::Base.deliveries.first
  end

  def reset_email
    ActionMailer::Base.deliveries = []
  end

  def email_count
    ActionMailer::Base.deliveries.count
  end

  def email_sent_to(to_address)
    ActionMailer::Base.deliveries.map(&:to).flatten.include?(to_address)
  end
end