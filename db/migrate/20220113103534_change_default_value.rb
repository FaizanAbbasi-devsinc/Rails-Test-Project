# frozen_string_literal: true

class ChangeDefaultValue < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :role, :integer, default: 1
  end

  def down
    change_column :users, :role, :integer, default: 0
  end
end
