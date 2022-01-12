# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :subscription

  enum bill_status: { paid: 0, unpaid: 1 }
end
