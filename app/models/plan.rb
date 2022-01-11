# frozen_string_literal: true

class Plan < ApplicationRecord
  has_many :features, inverse_of: :plan, dependent: :destroy
  accepts_nested_attributes_for :features, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :features, reject_if: ->(attributes) { attributes['code'].blank? }

  has_many :users, through: :subscriptions
  has_many :subscriptions
end
