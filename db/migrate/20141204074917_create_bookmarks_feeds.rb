class CreateBookmarksFeeds < ActiveRecord::Migration
  def change
    create_table :bookmarks_feeds do |t|

      t.timestamps
    end
  end
end
