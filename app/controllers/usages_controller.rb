# frozen_string_literal: true

class UsagesController < ApplicationController
  before_action :set_usage, only: %i[edit update]
  def index
    @usages = Usage.all
  end

  def show
    sub_id = Subscription.find(params[:id])
    @usages = sub_id.usages.all
  end

  def create
    @usage = Usage.new
  end

  def edit; end

  def update
    @usage['used_unit'] += usage_params[:used_unit].to_i
    if @usage.update(used_unit: @usage['used_unit'])
      flash[:success] = 'Usage Saved.'
      check_usage
    else
      flash[:danger] = 'Usage can not be saved, please try again.'
      render :new
    end
  end

  private

  def usage_params
    params.require(:usage).permit(:used_unit)
  end

  def set_usage
    @usage = Usage.find(params[:id])
  end

  def check_usage
    if @usage.used_unit > @usage.max_unit_limit
      @extra_units = @usage.used_unit.to_i - @usage.max_unit_limit.to_i
      @extra_units_price = Feature.find(@usage.features_id).unit_price.to_i * @extra_units
      if @usage.update(extra_usage_bill: @extra_units_price)
        UsageAlertMailer.with(user: current_user, usage: @usage).extra_usage_email.deliver_now!
        redirect_to subscriptions_path
      else
        flash.now[:notice] = 'Extra Bill Not be saved, please try again.'
      end
    else
      redirect_to subscriptions_path
    end
  end
end
