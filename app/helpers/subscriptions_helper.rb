module SubscriptionsHelper
  def findstatus(id)
    Subscription.find_by(id: id).status == 'active'
  end
end
