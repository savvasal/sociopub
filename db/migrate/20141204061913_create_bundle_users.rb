class CreateBundleUsers < ActiveRecord::Migration
  def change
    create_table :bundle_users do |t|
      t.integer :user_id
      t.integer :bundle_id

      t.timestamps
    end
  end
end
