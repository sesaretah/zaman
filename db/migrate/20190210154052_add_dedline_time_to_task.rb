class AddDedlineTimeToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :deadline_time, :time
  end
end
