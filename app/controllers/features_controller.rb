class FeaturesController < ApplicationController
  def index
    # byebug
    @plan = Plan.find(params[:plan_id])
    @features = @plan.features
  end

  def new
    @plan = Plan.find params[:plan_id]
    @feature = Feature.new
  end

  def create
    @plan = Plan.find(params[:plan_id])
    @feature = @plan.features.new(feature_params)
    if @feature.save
      redirect_to plans_path
    else
      redirect_to plan_features_path(@feature.plan_id)
    end
  end

  private

  def feature_params
    params.require(:feature).permit(:id, :name, :code, :unit_price, :max_unit_limit)
  end
end
