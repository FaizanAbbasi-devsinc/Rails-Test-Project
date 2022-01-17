# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    plan = Plan.find(params[:id])
    url = add_subscription_checkout_index_url(plan_id: plan.id)
    @session = StripeService.new(plan, url).strip_payment
    respond_to do |format|
      format.js
    end
  end

  def add_subscription
    @subscription = Subscription.new(plan_id: params[:plan_id], user_id: current_user.id, date: Time.current,
                                     status: 0)
    if @subscription.save
      flash[:success] = 'Plan subscribe successfully'
      redirect_to plans_path
    else
      @subscription.errors.full_messages
      redirect_to root_path
    end
  end
end
