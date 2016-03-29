class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.date :start
      t.date :end
      t.string :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
