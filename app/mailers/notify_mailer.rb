class NotifyMailer < ApplicationMailer
  default from: "admin@inventory.com"

  def send_email(user, item)
    @user = user
    @item = item
    mail(to: @user.email, subject: "Issue Resolved")
  end
end