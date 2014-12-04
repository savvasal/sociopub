class CreateFeedBookmarks < ActiveRecord::Migration
  def change
    create_table :feed_bookmarks do |t|
      t.integer :feed_id
      t.integer :bookmark_id

      t.timestamps
    end
  end
end
