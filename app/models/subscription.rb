# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :nullify
  belongs_to :plan
  has_many :usages, dependent: :delete_all
  accepts_nested_attributes_for :usages

  enum status: { active: 0, inactive: 1 }

  before_destroy :check_bill, prepend: true
  after_save :subscription_mail, :add_transaction, :add_usage

  def subscription_mail
    AutoUnsubscribeJob.set(wait: 200.seconds).perform_later(self.plan.id, user.id)
  end

  def check_bill
    extra_bill_amount = usages.sum(:extra_usage_bill)
    return unless extra_bill_amount.nonzero?

    Transaction.create!(subscription_id: id, amount: extra_bill_amount,
                                      user_id: user.id, transactions_date: Time.current, bill_status: 'unpaid')
  end

  def add_transaction
    transaction = Transaction.new(subscription_id: self.id, amount: self.plan.monthly_fee, user_id: user.id,
                                   transactions_date: Time.current, bill_status: 'paid')
    return unless transaction.save

    SubscriptionConfirmationMailer.with(user: user,
                                        transaction: transaction).subscription_confirmation.deliver_now!
  end

  def add_usage
    features = Subscription.find(self.id).plan.features
    features.each do |feature|
      Usage.create!(subscription_id: self.id, features_id: feature.id, max_unit_limit: feature.max_unit_limit)
    end
  end
end
