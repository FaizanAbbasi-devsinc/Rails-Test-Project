class ChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :subscriptions, :status, 'integer USING CAST(status AS integer)'
  end
end
