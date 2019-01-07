class RenameEndPoint < ActiveRecord::Migration
  def change
    rename_column :statuses, :end_pont, :end_point
  end
end
