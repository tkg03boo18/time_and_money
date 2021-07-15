class ChangeDatatypePriceofLists < ActiveRecord::Migration[5.2]
  def change
    change_column :lists, :price, :integer
  end
end
