class CreateBundleFeeds < ActiveRecord::Migration
  def change
    create_table :bundle_feeds do |t|
      t.integer :feed_id
      t.integer :bundle_id

      t.timestamps
    end
  end
end
