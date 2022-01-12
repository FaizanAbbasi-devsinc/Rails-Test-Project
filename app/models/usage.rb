# frozen_string_literal: true

class Usage < ApplicationRecord
  validates :used_unit, presence: true, numericality: { greater_than_or_equal_to: 1 }
  belongs_to :subscription
end
