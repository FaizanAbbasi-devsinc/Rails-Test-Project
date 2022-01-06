# frozen_string_literal: true

class ChangeStatusType < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :status # rubocop:disable Rails/BulkChangeTable
    add_column :users, :status, :integer
  end
end
