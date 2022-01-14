# frozen_string_literal: true

class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :name, null: false, limit: 15
      t.decimal :monthly_fee, null: false

      t.timestamps
    end
  end
end
