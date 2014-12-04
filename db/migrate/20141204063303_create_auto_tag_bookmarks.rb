class CreateAutoTagBookmarks < ActiveRecord::Migration
  def change
    create_table :auto_tag_bookmarks do |t|
      t.integer :tag_id
      t.integer :bookmark_id

      t.timestamps
    end
  end
end
