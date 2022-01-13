# frozen_string_literal: true

class Usage < ApplicationRecord
  validates :used_unit, presence: true  
  belongs_to :subscription
end
