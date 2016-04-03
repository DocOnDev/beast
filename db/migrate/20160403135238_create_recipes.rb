class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :web_page
      t.decimal :quantity
      t.string :unit

      t.timestamps null: false
    end
  end
end
