class AddUuidToProject < ActiveRecord::Migration
  def change
    add_column :projects, :uuid, :string
    add_index :projects, :uuid, unique: true
  end
end
