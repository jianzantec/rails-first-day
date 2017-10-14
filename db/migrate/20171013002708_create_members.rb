class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :user_name
      t.string :pwd
      t.integer :is_encryption, :default => 1
      t.string :name
      t.string :mobile
      t.string :qq
      t.text :description
      t.timestamps
    end
  end
end
