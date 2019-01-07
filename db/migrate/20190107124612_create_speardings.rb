class CreateSpeardings < ActiveRecord::Migration
  def change
    create_table :speardings do |t|
      t.string :event_id
      t.string :speardable_id
      t.string :speardable_type

      t.timestamps null: false
    end
    add_index :speardings, :event_id
    add_index :speardings, :speardable_id
    add_index :speardings, :speardable_type
  end
end
