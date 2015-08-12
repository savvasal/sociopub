class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :feed_id

      t.timestamps null: false
    end
    add_index :subscriptions, :user_id
    # μπορεί να μείνει το unique χωρίς το indexing;
    add_index :subscriptions, [:user_id, :feed_id], unique: true
  end
end
