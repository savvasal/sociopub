class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :url
      t.boolean :compatible, default: false
      t.timestamps null: false
    end
    add_index :websites, :url
  end
end
