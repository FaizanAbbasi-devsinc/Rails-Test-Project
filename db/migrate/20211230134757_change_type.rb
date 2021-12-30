# frozen_string_literal: true

class ChangeType < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :admin, :status
  end
end
