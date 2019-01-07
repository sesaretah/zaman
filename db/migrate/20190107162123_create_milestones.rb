class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :project_id
      t.string :uuid
      t.string :title
      t.text :details

      t.timestamps null: false
    end
    add_index :milestones, :project_id
    add_index :milestones, :uuid, unique: true
  end
end
