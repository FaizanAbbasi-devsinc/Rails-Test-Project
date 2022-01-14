# frozen_string_literal: true

module PlansHelper
  def findsubscriptions(_currrent_user, id)
    current_user.subscriptions.find_by(plan_id: id)&.status?
  end
end
