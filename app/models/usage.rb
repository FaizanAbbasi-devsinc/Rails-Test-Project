# frozen_string_literal: true

class Usage < ApplicationRecord
  validates :used_unit, presence: true
  belongs_to :subscription
  before_update :check_usage

  def check_usage
    if used_unit > max_unit_limit
      extra_units = used_unit.to_i - max_unit_limit.to_i
      extra_units_price = Feature.find(features_id).unit_price.to_i * extra_units
      if extra_units_price > 0
        self.extra_usage_bill = extra_units_price
        UsageAlertMailer.with(user: self.subscription.user, usage: self).extra_usage_email.deliver_now!
      else
        self.extra_usage_bill = 0
      end
    end
  end
end
