class CreateTransaction < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
        t.references :subscription, foreign_key: true
        t.references :user, foreign_key: true
        # t.float  :total_usage_limit
        t.date :transactions_date
        t.timestamps
    end
  end
end
