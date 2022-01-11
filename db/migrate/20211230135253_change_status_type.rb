# frozen_string_literal: true

class ChangeStatusType < ActiveRecord::Migration[6.1]
  change_table :users, bulk: true do |t|
    t.remove :status
    t.status :integer
  end
end
