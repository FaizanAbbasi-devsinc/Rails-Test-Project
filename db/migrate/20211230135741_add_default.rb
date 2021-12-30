# frozen_string_literal: true

class AddDefault < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :status, :integer, default: 1
  end
end
