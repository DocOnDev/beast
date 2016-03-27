class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :food_group, index: true, foreign_key: true
      t.string :username
      t.date :date
      t.decimal :portion
      t.string :description

      t.timestamps null: false
    end
  end
end
