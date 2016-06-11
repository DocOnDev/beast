class RenameDietStartAndEnd < ActiveRecord::Migration
  def change
    change_table :diets do |t|
      t.rename :start, :start_date
      t.rename :end, :end_date
    end
  end
end
