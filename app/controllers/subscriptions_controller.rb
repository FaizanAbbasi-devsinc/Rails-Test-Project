# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def index
    @subscriptions = if current_user.admin?
                       Subscription.all
                     else
                       current_user.subscriptions.all
                     end
  end

  def destroy
    @user = User.find(current_user.id)
    check_bill(params[:id])
    @user.subscriptions.where(plan_id: params[:id]).destroy_all
  end

  private

  def check_bill(plan_id)
    @plan = Plan.find(plan_id)
    @sub_id = @plan.subscriptions[0]
    @extra_bill_amount = @sub_id.usages.sum(:extra_usage_bill)
    if @extra_bill_amount.zero?
      flash[:success] = 'you unsubscribe successfully'
      redirect_to subscriptions_path
    else
      @transaction = Transaction.create(subscription_id: @sub_id.id, amount: @extra_bill_amount,
                                        user_id: current_user.id, transactions_date: Time.zone.now, bill_status: 1)
      flash[:success] =
        'you unsubscribe successfully & bill has been charged againt your extra usage units.'
      redirect_to plans_path
    end
  end
  # def update
  #   @user = User.find(current_user.id)
  #   z = @user.subscriptions.where(plan_id: params[:id])
  #   z.update(status: 1)
  #   redirect_to subscriptions_path
  # end
end
