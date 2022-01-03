class AddPlanToFeatures < ActiveRecord::Migration[6.1]
  def change
    add_reference :features, :plan, null: false, foreign_key: true, index: true
  end
end
