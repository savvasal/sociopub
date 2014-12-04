class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.timestamps null: false
    end
    add_index :bookmarks, [:created_at]
  end
end
