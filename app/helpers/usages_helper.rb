# frozen_string_literal: true

module UsagesHelper
  def findplan(usage)
    usages = Usage.find_by(id: usage)
    usages.subscription.plan_id
  end
end
