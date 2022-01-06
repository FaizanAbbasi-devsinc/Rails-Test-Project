class CheckoutController < ApplicationController
    
    def create
        plan = Plan.find(params[:id])
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                name: plan.name,
                amount: plan.monthly_fee.to_i,
                currency: "usd",
                quantity: 1
                }],
              mode: 'payment',
              success_url:  checkout_add_subscription_url(plan_id: plan.id),
              cancel_url: 'https://example.com/cancel'
            })
            respond_to do |format|
                format.js
            end
    end

    def add_subscription
      @subscription = Subscription.new(plan_id: params[:plan_id], user_id: current_user.id,date: Time.zone.now,status: 0)
      @subscription.save
      sub_id = @subscription.id 
      amount = @subscription.plan.monthly_fee
      if @subscription.save
        
        add_transaction(sub_id, amount)
        redirect_to plans_path
      else
        redirect_to :error
      end
    end

    private
    
    def add_transaction(subscriptions_id, amount)
      byebug
      Transaction.create(subscription_id: subscriptions_id, amount: amount, user_id: current_user.id,transactions_date: Time.zone.now)
    end
end
