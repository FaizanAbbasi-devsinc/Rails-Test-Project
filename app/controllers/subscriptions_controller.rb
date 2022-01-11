
class SubscriptionsController < ApplicationController
    def create
        # byebug
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
    
    # def destroy
    #   @user = User.find(current_user.id)
    #   @user.subscriptions.where(plan_id: params[:id]).destroy_all
    #   flash[:success] = "The to-do item was successfully destroyed."
    #   redirect_to subscriptions_path
    # end

    def update
      @user = User.find(current_user.id)
      z = @user.subscriptions.where(plan_id: params[:id])
      z.update_all(status: 1)
      redirect_to subscriptions_path
    end
end
