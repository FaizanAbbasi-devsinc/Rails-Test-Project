# frozen_string_literal: true

class AddColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :amount, :integer
  end
end
