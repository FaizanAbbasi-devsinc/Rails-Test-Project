# frozen_string_literal: true

class CreateUsages < ActiveRecord::Migration[6.1]
  def change
    create_table :usages do |t|
      t.integer :used_unit, default: 0
      t.references :subscription, null: false, foreign_key: true
      t.float :extra_usage_bill, default: 0.0
      t.integer :max_unit_limit
      t.references :features, null: false, foreign_key: true

      t.timestamps
    end
  end
end
