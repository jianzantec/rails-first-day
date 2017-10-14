class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.string :name
      t.text :description
      t.string :teacher
      t.string :master
      t.timestamps
    end
  end
end
