# frozen_string_literal: true

class ChangeStatusType < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :status
    add_column :users, :status, :integer
  end
end
