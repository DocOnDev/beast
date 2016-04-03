class CreateNutritionalValues < ActiveRecord::Migration
  def change
    create_table :nutritional_values do |t|
      t.integer :recipe_id
      t.integer :food_group_id
      t.decimal :quantity

      t.timestamps null: false
    end
  end
end
