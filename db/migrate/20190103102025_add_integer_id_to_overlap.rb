class AddIntegerIdToOverlap < ActiveRecord::Migration
  def change
    add_column :overlaps, :integer_id, :integer
  end
end
