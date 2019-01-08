class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :milestone_id
      t.string :uuid
      t.string :title
      t.date :deadline
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :tasks, :milestone_id
    add_index :tasks, :uuid, unique: true
  end
end
