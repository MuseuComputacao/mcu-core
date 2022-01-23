class ChangeUserNotNullPropeties < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :role, :string, null: false
    change_column :users, :name, :string, null: false
  end
end
