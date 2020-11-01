# Preview all emails at http://localhost:3000/rails/mailers/notify_mailer
class NotifyMailerPreview < ActionMailer::Preview
  def send_mail_preview
    NotifyMailer.send_email(User.find(3))
  end
end
