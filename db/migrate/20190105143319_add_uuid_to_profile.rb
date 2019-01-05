class AddUuidToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :uuid, :string
    add_index :profiles, :uuid, unique: true
  end
end
