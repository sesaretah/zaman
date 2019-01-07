class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :user_id
      t.string :project_id
      t.string :uuid
      t.string :status_id

      t.timestamps null: false
    end
    add_index :participations, :project_id
    add_index :participations, :uuid, unique: true
    add_index :participations, :status_id
  end
end
