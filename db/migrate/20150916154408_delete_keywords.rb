class DeleteKeywords < ActiveRecord::Migration
  def change
    drop_table :keywords
  end
end
