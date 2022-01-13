# frozen_string_literal: true

class ChangeDefaultValue < ActiveRecord::Migration[6.1]
  def up
    change_column_default :users, :role, 1
  end

  def down
    change_column_default :users, :role, 0
  end
end
