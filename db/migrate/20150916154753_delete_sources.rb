class DeleteSources < ActiveRecord::Migration
  def change
    drop_table :sources
  end
end
