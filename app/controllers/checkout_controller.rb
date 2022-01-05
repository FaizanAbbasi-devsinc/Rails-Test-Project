class CheckoutController < ApplicationController
    
    def create
        plan = Plan.find(params[:id])
        # byebug
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                name: plan.name,
                amount: plan.monthly_fee.to_i,
                currency: "usd",
                quantity: 1
                }],
              mode: 'payment',
              success_url:  'http://localhost:3000/checkout/add_subscription',
              cancel_url: 'https://example.com/cancel',
            })
            respond_to do |format|
                format.js
            end
    end

    def add_subscription
        @plan = Plan.find(params[:plan_id])
        byebug
        @subscription = @plan.Subscription.create(subscription_params)
        @subscription.save
        if @subscription.save
            redirect_to plans_path
          else
            redirect_to :error
          end
     end
  
     private
  
     def subscription_params
        @currentUser = current_user.id
        @currentDate = Time.now()
        params.require(:subscription).permit(:currentUser, :currentDate, :params)
     end


end