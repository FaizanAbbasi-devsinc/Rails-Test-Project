class Subscription < ApplicationRecord
    belongs_to :user
    belongs_to :plan
    enum status: [:subscribe, :unsubscribe]

    
end
