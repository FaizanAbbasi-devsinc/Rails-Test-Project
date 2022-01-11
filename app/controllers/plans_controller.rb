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
    if @plan.save
      redirect_to plans_path
    else
      render 'plans/new'
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :monthly_fee,
                                 features_attributes: %i[id name code unit_price max_unit_limit])
  end
end
