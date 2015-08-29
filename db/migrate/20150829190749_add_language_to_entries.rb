class AddLanguageToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :language, :string
  end
end
