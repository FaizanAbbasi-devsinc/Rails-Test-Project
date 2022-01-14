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
    return unless current_user.buyer?

    if current_user.subscriptions.where(plan_id: params[:id]).destroy_all
      flash[:success] = 'You Unsubscribe Successfully.'
      redirect_to plans_path
    else
      current_user.subscriptions.errors.full_messages
      redirect_to subscriptions_path
    end
  end
end
