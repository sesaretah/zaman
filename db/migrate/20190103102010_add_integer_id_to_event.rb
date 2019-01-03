class AddIntegerIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :integer_id, :integer
  end
end
