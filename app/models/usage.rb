# frozen_string_literal: true

class Usage < ApplicationRecord
  validates :used_unit, presence: true
  belongs_to :subscription
  after_update :check_usage, if: :saved_change_to_used_unit?

  def check_usage
    if used_unit > max_unit_limit
      extra_units = used_unit.to_i - max_unit_limit.to_i
      extra_units_price = Feature.find(features_id).unit_price.to_i * extra_units
      extra_usage_bill = if extra_units_price.positive?
                           extra_units_price
                         #  UsageAlertMailer.with(user: User.current, usage: self).extra_usage_email.deliver_now!
                         #  byebug
                         else
                           0
                         end
                         save
      # if usage.update(extra_usage_bill: @extra_units_price)
      #   UsageAlertMailer.with(user: current_user, usage: @usage).extra_usage_email.deliver_now!
      #   redirect_to subscriptions_path
      # else
      #   flash.now[:notice] = 'Extra Bill Not be saved, please try again.'
      # end
      # else
      # redirect_to subscriptions_path
    end
  end
end
