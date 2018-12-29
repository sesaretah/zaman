class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :event_date
      t.time :starts_at
      t.time :ends_at
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
