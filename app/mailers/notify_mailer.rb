class NotifyMailer < ApplicationMailer
  default from: "admin@inventory.com"

  def send_email(user)
    @user = user
    mail(to: @user.email, subject: "Issue Resolved")    
  end
end
