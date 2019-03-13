class AddTaskIdToDiscussion < ActiveRecord::Migration
  def change
    add_column :discussions, :task_id, :string
    add_index :discussions, :task_id
  end
end
