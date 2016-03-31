class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.date :date
      t.text :narrative
      t.integer :sleep_score
      t.float :body_weight
      t.integer :step_count

      t.timestamps null: false
    end

    add_reference :diaries, :user, index: true
    add_foreign_key :diaries, :users

  end
end
