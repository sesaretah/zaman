class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :scope_type
      t.string :title
      t.string :uuid
      t.string :next_id
      t.string :previous_id
      t.boolean :start_point
      t.boolean :end_pont

      t.timestamps null: false
    end
    add_index :statuses, :uuid, unique: true
    add_index :statuses, :next_id
    add_index :statuses, :previous_id
  end
end
