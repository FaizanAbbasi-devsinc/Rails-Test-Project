# frozen_string_literal: true

class CreateFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :features do |t|
      t.string :name, null: false, limit: 15
      t.integer :code, null: false, unique: true
      t.integer :unit_price, null: false
      t.integer :max_unit_limit, null: false

      t.timestamps
    end
  end
end
