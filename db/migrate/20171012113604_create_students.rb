class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :gender
      t.string :mobile
      t.string :qq
      t.integer :row_id
      t.integer :col_id
      t.integer :grade_id
      t.string :description
      t.timestamps
    end
  end
end
