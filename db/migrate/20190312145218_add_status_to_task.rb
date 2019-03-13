class AddStatusToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :status_id, :string
    add_index :tasks, :status_id
  end
end
