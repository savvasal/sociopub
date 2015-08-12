class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.integer :entry_id
      t.integer :feed_id

      t.timestamps null: false
    end
    add_index :sources, :feed_id
    add_index :sources, [:entry_id, :feed_id], unique: true
  end
end
