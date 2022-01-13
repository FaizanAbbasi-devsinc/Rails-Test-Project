# frozen_string_literal: true

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
    if @plan.save
      flash[:success] = 'Plan Created Successfully.'
      redirect_to plans_path
    else
      flash[:danger] = 'Please Enter Correct Details For Plan.'
      redirect_to new_plan_path
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :monthly_fee,
                                 features_attributes: %i[id name code unit_price max_unit_limit])
  end
end
