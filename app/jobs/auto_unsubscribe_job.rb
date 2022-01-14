# frozen_string_literal: true

class AutoUnsubscribeJob < ApplicationJob
  queue_as :default

  def perform(plan_id, user_id)
    @user = User.find_by(id: user_id)
    @plan = Plan.find_by(id: plan_id)
    @sub_id = @plan.subscriptions[0]
    @extra_bill_amount = @sub_id.usages.sum(:extra_usage_bill)
    @user.subscriptions.where(plan_id: plan_id).destroy_all
  end
end
