# frozen_string_literal: true

class UsagesController < ApplicationController
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

  def edit
    @usage = Usage.find(params[:id])
  end

  def update
    @usage = Usage.find(params[:id])
    @usage['used_unit'] += usage_params[:used_unit].to_i
    if @usage.update(used_unit: @usage['used_unit'])
      flash[:success] = 'Usage Saved.'
      check_usage
    else
      # flash.now[:notice] = 'Usage can not be saved, please try again.'
      render :new
    end
  end

  private

  def usage_params
    params.require(:usage).permit(:used_unit)
  end

  def check_usage
    if @usage.used_unit > @usage.max_unit_limit
      @extra_units = @usage.used_unit.to_i - @usage.max_unit_limit.to_i
      @extra_units_price = Feature.find(@usage.features_id).unit_price.to_i * @extra_units
      if @usage.update(extra_usage_bill: @extra_units_price)
        redirect_to subscriptions_path
      else
        flash.now[:notice] = 'Extra Bill Not be saved, please try again.'
      end
    else
      redirect_to subscriptions_path
    end
    UsageAlertMailer.with(user: current_user, usage: @usage).extra_usage_email.deliver_now!
  end
end
