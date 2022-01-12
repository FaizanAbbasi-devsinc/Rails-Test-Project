# frozen_string_literal: true

class Feature < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[a-zA-Z0-9 ]+\Z/, message: 'only numbers and letters allowed' }
  validates :code, presence: true, numericality: { other_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :max_unit_limit, presence: true, numericality: { greater_than_or_equal_to:1 }

  belongs_to :plan
end
