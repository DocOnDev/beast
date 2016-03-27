class CreateFoodGroups < ActiveRecord::Migration
  def change
    create_table :food_groups do |t|
      t.string :name
      t.text :description
      t.integer :calories

      t.timestamps null: false
    end
  end
end
