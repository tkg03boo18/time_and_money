class RemoveAlldayFromPlans < ActiveRecord::Migration[5.2]
  def change
    remove_column :plans, :allday, :boolean
  end
end
