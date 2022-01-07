class SubscriptionsController < ApplicationController
    def create
        byebug
        @plan = Plan.find(params[:plan_id])
        
        # @subscription = Subscription.create(feature_params)
        # if @feature.save
        #   redirect_to plans_path
        # else
        #   redirect_to plan_features_path(feature.plan_id)
        # end
      end

    def index
      @user = User.find(current_user.id)
      @subscriptions = @user.subscriptions.all
    end
    
    #   private
    #     def plan_params
    #         params.permit(:name, :monthly_fee, features_attributes: [:id, :name, :code, :unit_price, :max_unit_limit])
    #     end
end
