class RenameGenreColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :genre, :urgency
  end
end
