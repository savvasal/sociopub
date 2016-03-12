class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.integer :entry_id
      t.integer :word_id

      t.timestamps null: false
    end
  end
end
