class AddIntegerIdToAdvertiser < ActiveRecord::Migration
  def change
    add_column :advertisers, :integer_id, :integer
  end
end
