class AddClumnToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :avatars, :string
    add_column :members, :avatars, :string
  end
end
