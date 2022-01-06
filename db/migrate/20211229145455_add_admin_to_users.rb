# frozen_string_literal: true

# Add Attributes to User Table
class AddAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users, bulk: true do |t|
      t.boolean :admin, default: false
      t.string :name
    end
  end
end
