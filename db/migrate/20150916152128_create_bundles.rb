class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.integer :concept_id
      t.integer :keyword_id
      
      t.timestamps null: false
    end
  end
end
