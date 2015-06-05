class UserMailer < ApplicationMailer
  layout 'mailer'
  default from: "noreply@designscook.com"
  
  def notification_email(user)
    @user = user
    @url = 'http://designscook.com'
    @notification = 'Updates from Designscook'
    mail(to: @user.email, subject: 'DesignsCook updates')
  end
end
