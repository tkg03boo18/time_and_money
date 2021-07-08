class RemovePaymentMethodFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :payment_method, :integer
  end
end
