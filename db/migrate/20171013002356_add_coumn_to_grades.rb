class AddCoumnToGrades < ActiveRecord::Migration[5.1]
  def change
    add_column :grades, :member_id, :integer
  end
end
