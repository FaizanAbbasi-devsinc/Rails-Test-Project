# frozen_string_literal: true

class FeaturesController < ApplicationController
  before_action :set_plan, only: %i[index new create]

  def index
    @features = @plan.features
  end

  def new
    @feature = Feature.new
  end

  def create
    @feature = @plan.features.new(feature_params)
    if @feature.save
      redirect_to plans_path
    else
      @feature.errors.full_messages
      redirect_to plan_features_path(@feature.plan_id)
    end
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def feature_params
    params.require(:feature).permit(:id, :name, :code, :unit_price, :max_unit_limit)
  end
end
