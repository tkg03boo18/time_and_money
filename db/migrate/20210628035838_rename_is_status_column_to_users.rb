class RenameIsStatusColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :is_status, :is_deleted
  end
end
