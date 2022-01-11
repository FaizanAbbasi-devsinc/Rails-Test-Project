# frozen_string_literal: true

class ChangeColumnTypeInPlanTable < ActiveRecord::Migration[6.1]
  def up
    change_column :plans, :monthly_fee, :int
  end

  def down
    change_column :plans, :monthly_fee, :decimal
  end
end
