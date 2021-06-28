class AddIsStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_status, :boolean, default: false, null: false
  end
end
