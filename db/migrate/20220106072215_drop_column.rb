class DropColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :subscriptions, :current_usage
  end
end
