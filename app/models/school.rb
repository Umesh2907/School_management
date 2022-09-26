class School < ApplicationRecord
  has_many :users
  has_many :teachers
  has_many :standards
  # has_many :users, as: :teachers
  # has_many :students, through: :standards
  
end
