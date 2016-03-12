class AddConceptIdToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :concept_id, :integer
  end
end
