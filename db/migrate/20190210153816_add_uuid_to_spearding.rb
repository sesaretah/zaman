class AddUuidToSpearding < ActiveRecord::Migration
  def change
    add_column :speardings, :uuid, :string
    add_index :speardings, :uuid, unique: true
  end
end
