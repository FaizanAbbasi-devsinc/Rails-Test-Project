class Subscription < ApplicationRecord
    belongs_to :user
    has_many :transactions, dependent: :nullify 
    belongs_to :plan

    enum status: [:subscribe, :unsubscribe]
end
