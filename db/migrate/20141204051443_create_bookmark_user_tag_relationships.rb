class CreateBookmarkUserTagRelationships < ActiveRecord::Migration
  def change
    create_table :bookmark_user_tag_relationships do |t|
      t.integer :bookmark_user_relationship_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
