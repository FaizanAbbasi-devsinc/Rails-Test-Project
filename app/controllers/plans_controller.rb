class PlansController < ApplicationController
    def index
        @plans = Plan.all
    end

    def new
        @plan = Plan.new
        @plan.features.new
    end

    def create
        @plan = Plan.new(plan_params)
        @plan.user_id = current_user.id
        # byebug
        if @plan.save
            redirect_to plans_path
        else
            redirect_to plans_path
        end
    end

    private
        def plan_params
            params.require(:plan).permit(:name, :monthly_fee, features_attributes: [:id, :name, :code, :unit_price, :max_unit_limit])
        end
end