class AddDateTimePublishedToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :published, :datetime
    add_index :entries, :published
  end
end
