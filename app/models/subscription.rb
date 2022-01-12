# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :nullify
  belongs_to :plan
  has_many :usages, dependent: :delete_all
  accepts_nested_attributes_for :usages

  enum status: { active: 0, inactive: 1 }
end
