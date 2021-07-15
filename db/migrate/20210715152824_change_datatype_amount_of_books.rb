class ChangeDatatypeAmountOfBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :amount, :integer
  end
end
