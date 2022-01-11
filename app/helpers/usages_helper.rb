
module UsagesHelper
  def findplan(usage)
    @usages = Usage.find(usage)
    @usages.subscription.plan_id
  end
end
