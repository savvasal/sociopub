class RemoveCompatibleFromFeeds < ActiveRecord::Migration
  def change
    remove_column :feeds, :compatible, :boolean
  end
end
