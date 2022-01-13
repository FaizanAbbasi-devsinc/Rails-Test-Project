# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    plan = Plan.find(params[:id])
    url = checkout_add_subscription_url(plan_id: plan.id)
    @session = StripeService.new(plan, url).strip_payment
    respond_to do |format|
      format.js
    end
  end

  def add_subscription
    @subscription = Subscription.new(plan_id: params[:plan_id], user_id: current_user.id, date: Time.zone.now,
                                     status: 0)
    if @subscription.save
      sub_id = @subscription.id
      amount = @subscription.plan.monthly_fee
      AutoUnsubscribeJob.set(wait: 70.seconds).perform_later(@subscription.plan.id, current_user.id)
      add_transaction(sub_id, amount)
      add_usage(sub_id)
      redirect_to plans_path
    else
      redirect_to :error
    end
  end

  private

  def add_transaction(subscriptions_id, amount)
    @transaction = Transaction.new(subscription_id: subscriptions_id, amount: amount, user_id: current_user.id,
                                   transactions_date: Time.zone.now, bill_status: 0)
    return unless @transaction.save

    SubscriptionConfirmationMailer.with(user: current_user,
                                        transaction: @transaction).subscription_confirmation.deliver_now!
  end

  def add_usage(subscriptions_id)
    a = Subscription.find(subscriptions_id)
    features = a.plan.features
    features.each do |feature|
      Usage.create!(subscription_id: a.id, features_id: feature.id, max_unit_limit: feature.max_unit_limit)
    end
  end
end
