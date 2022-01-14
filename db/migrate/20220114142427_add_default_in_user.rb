# frozen_string_literal: true

class AddDefaultInUser < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :name, :string, default: 'Buyer'
  end

  def down
    change_column :users, :status, :integer
  end
end
