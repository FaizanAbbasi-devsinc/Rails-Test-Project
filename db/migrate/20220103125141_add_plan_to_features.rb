# frozen_string_literal: true

class AddPlanToFeatures < ActiveRecord::Migration[6.1]
  def change
    add_reference :features, :plan, null: false, foreign_key: true, index: true, default: false
  end
end
