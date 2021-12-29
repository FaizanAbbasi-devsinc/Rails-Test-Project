# frozen_string_literal: true

# Add Attributes to User Table
class AddAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :name, :string
  end
end
