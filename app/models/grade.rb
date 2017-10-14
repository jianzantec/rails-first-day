class Grade < ApplicationRecord
  has_many :rows
  has_many :cols
  has_many :students
  belongs_to :member
end
