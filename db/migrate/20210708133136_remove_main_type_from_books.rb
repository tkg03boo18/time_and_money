class RemoveMainTypeFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :main_type, :integer
    remove_column :books, :sub_type, :integer
  end
end
