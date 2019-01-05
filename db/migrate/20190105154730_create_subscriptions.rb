class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :advertiser_id
      t.integer :user_id
      t.string :uuid
      t.string :status_id

      t.timestamps null: false
    end
    add_index :subscriptions, :advertiser_id
    add_index :subscriptions, :uuid, unique: true
    add_index :subscriptions, :status_id
  end
end
