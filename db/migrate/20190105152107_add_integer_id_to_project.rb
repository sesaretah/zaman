class AddIntegerIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :integer_id, :integer
    add_index :projects, :integer_id
  end
end
