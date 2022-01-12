# frozen_string_literal: true

class ChangeColumnTypeIntToFloat < ActiveRecord::Migration[6.1]
  def up
    change_column :features, :unit_price, :float
    change_column :plans, :monthly_fee, :float
  end

  def down
    change_column :features, :unit_price, :int
    change_column :plans, :monthly_fee, :int
  end
end
