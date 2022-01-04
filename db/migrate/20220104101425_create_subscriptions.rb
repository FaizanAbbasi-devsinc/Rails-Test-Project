class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.references :plan, foreign_key: true
      t.references :user, foreign_key: true
      t.date :date
      t.float :current_usage
      t.string :status

      t.timestamps
    end
  end
end
