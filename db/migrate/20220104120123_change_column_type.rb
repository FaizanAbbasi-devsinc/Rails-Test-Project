# frozen_string_literal: true

class ChangeColumnType < ActiveRecord::Migration[6.1]
  def up
    change_column :subscriptions, :status, 'integer USING CAST(status AS integer)'
  end
end
