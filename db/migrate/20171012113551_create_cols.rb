class CreateCols < ActiveRecord::Migration[5.1]
  def change
    create_table :cols do |t|
      t.string :name
      t.string :description
      t.integer :grade_id
      t.timestamps
    end
  end
end
