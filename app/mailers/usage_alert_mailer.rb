class UsageAlertMailer < ApplicationMailer
  
  def extra_usage_email
    @user = params[:user]
    @usage  = params[:usage]
    mail(to: @user.email, subject: 'You exceed your Usage Limit')
  end
end
