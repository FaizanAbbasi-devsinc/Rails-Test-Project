class SubscriptionConfirmationMailer < ApplicationMailer
    def subscription_confirmation
    @user = params[:user]
    @transaction = params[:transaction]
    mail(to: @user.email, subject: 'Subscription Confirmation')
  end
end
