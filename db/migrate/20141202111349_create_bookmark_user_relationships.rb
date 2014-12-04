class CreateBookmarkUserRelationships < ActiveRecord::Migration
  def change
    create_table :bookmark_user_relationships do |t|
      t.integer :user_id
      t.integer :bookmark_id

      t.timestamps
    end
  end
end
