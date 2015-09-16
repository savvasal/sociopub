class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.string :title, null:false, required: true, unique: true      
      t.timestamps null: false
    end
  end
end
