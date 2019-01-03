class CreateOverlaps < ActiveRecord::Migration
  def change
    create_table :overlaps do |t|
      t.string :event_id
      t.string :overlaper_id
      t.string :uuid

      t.timestamps null: false
    end
    add_index :overlaps, :event_id
    add_index :overlaps, :overlaper_id
    add_index :overlaps, :uuid, unique: true
  end
end
