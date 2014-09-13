class UserEmail < ActionMailer::Base
  default from: "noreply@example.com"

  def deliver_send_email(email, subject, body)
    mail(:to => email, :subject => subject, :body => body)
  end
end
