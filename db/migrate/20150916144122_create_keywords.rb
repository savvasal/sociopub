class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :keyword, null:false, required: true, unique: true 

      t.timestamps null: false
    end
  end
end
