class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.text :content
      t.string :uuid
      t.integer :tasks_id

      t.timestamps null: false
    end
    add_index :discussions, :uuid, unique: true
  end
end
