class AddDetailsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :main_category_id, :integer
    add_column :books, :sub_category_id, :integer
    add_column :books, :main_type, :integer
    add_column :books, :sub_type, :integer
  end
end
