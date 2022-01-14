# frozen_string_literal: true

class UsagesController < ApplicationController
  before_action :set_usage, only: %i[edit update]
  def index
    @usages = Usage.all
  end

  def show
    sub_id = Subscription.includes(:usages).find(params[:id])
    @usages = sub_id.usages
  end

  def create
    @usage = Usage.new
  end

  def edit; end

  def update
    new_usage = @usage['used_unit'] + usage_params[:used_unit].to_i
    if @usage.update(used_unit: new_usage)
      flash[:success] = 'Usage Saved.'
      redirect_to subscriptions_path
    else
      @usage.errors.full_messages
      render :new
    end
  end

  private

  def usage_params
    params.require(:usage).permit(:id, :used_unit)
  end

  def set_usage
    @usage = Usage.find(params[:id])
  end
end
