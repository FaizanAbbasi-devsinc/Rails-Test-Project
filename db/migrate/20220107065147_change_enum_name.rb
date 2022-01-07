class ChangeEnumName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :roll, :role
  end
end
