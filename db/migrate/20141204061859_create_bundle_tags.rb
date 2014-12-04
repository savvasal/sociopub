class CreateBundleTags < ActiveRecord::Migration
  def change
    create_table :bundle_tags do |t|
      t.integer :tag_id
      t.integer :bundle_id

      t.timestamps
    end
  end
end
