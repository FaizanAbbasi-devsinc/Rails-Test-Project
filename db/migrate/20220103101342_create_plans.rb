class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :monthly_fee

      t.timestamps
    end
  end
end
