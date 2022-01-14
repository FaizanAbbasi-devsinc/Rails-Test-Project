# frozen_string_literal: true

class Plan < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 15 },
                   format: { with: /\A[a-zA-Z0-9 ]+\Z/, message: 'only numbers and letters allowed' }
  validates :monthly_fee, presence: true, numericality: { greater_than_or_equal_to: 1 }

  has_many :features, inverse_of: :plan, dependent: :destroy
  accepts_nested_attributes_for :features, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :features, reject_if: ->(attributes) { attributes['code'].blank? }
  has_many :users, through: :subscriptions
  has_many :subscriptions, dependent: :destroy
end
