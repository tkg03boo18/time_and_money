class RemovejobFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :job, :integer
    remove_column :users, :area, :integer
  end
end
