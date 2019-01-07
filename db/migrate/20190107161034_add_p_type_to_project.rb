class AddPTypeToProject < ActiveRecord::Migration
  def change
    add_column :projects, :p_type, :string
  end
end
