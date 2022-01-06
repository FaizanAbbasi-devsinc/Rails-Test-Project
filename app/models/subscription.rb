class Subscription < ApplicationRecord
    belongs_to :user
    has_many :transactions
    belongs_to :plan
    enum status: [:subscribe, :unsubscribe]
end
