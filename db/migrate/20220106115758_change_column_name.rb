# frozen_string_literal: true

class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :status, :roll
  end
end
