class RemoveFeedIdFromSubscriptions < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :feed_id, :integer
  end
end
