# frozen_string_literal: true

class CreateTransaction < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :subscription, foreign_key: true
      t.references :user, foreign_key: true
      t.date :transactions_date, null: false
      t.timestamps
    end
  end
end
