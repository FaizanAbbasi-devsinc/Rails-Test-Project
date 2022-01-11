class Usage < ApplicationRecord
  validates :used_unit, presence: true
  belongs_to :subscription
end
