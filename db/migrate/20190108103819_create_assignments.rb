class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :task_id
      t.integer :user_id
      t.string :uuid

      t.timestamps null: false
    end
    add_index :assignments, :task_id
    add_index :assignments, :uuid
  end
end
