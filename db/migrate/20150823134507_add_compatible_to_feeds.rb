class AddCompatibleToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :compatible, :boolean, default: false
  end
end
