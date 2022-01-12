# frozen_string_literal: true

class FeaturesController < ApplicationController
  def index
    set_plan
    @features = @plan.features
  end

  def new
    set_plan
    @feature = Feature.new
  end

  def create
    set_plan
    @feature = @plan.features.create(feature_params)
    if @feature.save
      redirect_to plans_path
    else
      redirect_to plan_features_path(feature.plan_id)
    end
  end

  private

  def feature_params
    params.require(:feature).permit(:id, :name, :code, :unit_price, :max_unit_limit)
  end

  def set_plan
    @plan = Plan.find params[:plan_id]
  end
end
