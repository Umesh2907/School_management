class ClassRoom < ApplicationRecord
  belongs_to :school
  has_many :lectures
end
