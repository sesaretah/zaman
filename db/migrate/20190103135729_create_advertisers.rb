class CreateAdvertisers < ActiveRecord::Migration
  def change
    create_table :advertisers do |t|
      t.string :uuid
      t.string :title
      t.text :details
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :advertisers, :uuid, unique: true
  end
end
