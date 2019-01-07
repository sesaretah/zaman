class AddPTypeToAdvertiser < ActiveRecord::Migration
  def change
    add_column :advertisers, :p_type, :string
  end
end
