class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :job, :integer
    add_column :users, :area, :integer
  end
end
