class AddContentToEvent < ActiveRecord::Migration
  def change
    add_column :events, :content, :string
  end
end
