class School < ApplicationRecord
  has_many :users
  has_many :class_rooms
end
