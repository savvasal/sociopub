class CreateUserFeedSubscriptions < ActiveRecord::Migration
  def change
    create_table :user_feed_subscriptions do |t|
      t.integer :feed_id
      t.integer :user_id

      t.timestamps
    end
  end
end
