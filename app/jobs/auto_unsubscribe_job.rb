# frozen_string_literal: true

class AutoUnsubscribeJob < ApplicationJob
  queue_as :default

  def perform(plan_id, user_id)
    @user = User.find(user_id)
    @plan = Plan.find(plan_id)
    @sub_id = @plan.subscriptions[0]
    @extra_bill_amount = @sub_id.usages.sum(:extra_usage_bill)
    return unless @extra_bill_amount.nonzero?

    @transaction = Transaction.create(subscription_id: @sub_id.id, amount: @extra_bill_amount,
                                      user_id: user_id, transactions_date: Time.zone.now, bill_status: 1)

    @user.subscriptions.where(plan_id: plan_id).destroy_all
  end
end
