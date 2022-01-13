# frozen_string_literal: true

class StripeService
  def initialize(plan, url)
    @plan = plan
    @url = url
  end

  def strip_payment
    Stripe::Checkout::Session.create({
                                       payment_method_types: ['card'],
                                       line_items: [{
                                         name: @plan.name,
                                         amount: @plan.monthly_fee.to_i * 100,
                                         currency: 'usd',
                                         quantity: 1
                                       }],
                                       mode: 'payment',
                                       success_url: @url,
                                       cancel_url: 'https://example.com/cancel'
                                     })
  end
end
