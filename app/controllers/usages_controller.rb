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
    @usage["used_unit"] += usage_params[:used_unit].to_i
      if @usage.update(used_unit: @usage["used_unit"])
        check_usage(@usage)
        redirect_to subscriptions_path
      else
        redirect_to usages_path
      end
  end

  private
    def usage_params
      params.require(:usage).permit(:used_unit)
    end

    def check_usage(usage)
      if @usage.used_unit > @usage.max_unit_limit
        UsageAlertMailer.with(user: current_user, usage: @usage).extra_usage_email.deliver_now!
      end 
    end
end
