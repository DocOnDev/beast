class AddUserToEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :user_id
    add_reference :entries, :user, index: true, foreign_key: true
  end
end
