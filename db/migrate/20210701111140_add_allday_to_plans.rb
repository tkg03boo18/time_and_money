class AddAlldayToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :allday, :boolean, default: false, null: false
  end
end
