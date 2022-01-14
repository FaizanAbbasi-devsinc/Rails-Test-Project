# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :nullify
  belongs_to :plan
  has_many :usages, dependent: :delete_all
  accepts_nested_attributes_for :usages

  enum status: { active: 0, inactive: 1 }

  before_destroy :check_bill, prepend: true

  def check_bill
    @extra_bill_amount = usages.sum(:extra_usage_bill)
    return unless @extra_bill_amount.nonzero?

    @transaction = Transaction.create(subscription_id: id, amount: @extra_bill_amount,
                                      user_id: user.id, transactions_date: Time.current, bill_status: 1)
  end
end
