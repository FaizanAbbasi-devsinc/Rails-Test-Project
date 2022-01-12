# frozen_string_literal: true

class DropColumn < ActiveRecord::Migration[6.1]
  def up
    remove_column :subscriptions, :current_usage
  end
end
