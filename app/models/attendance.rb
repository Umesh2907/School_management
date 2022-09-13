class Attendance < ApplicationRecord
  belongs_to :user

  enum attendance: [:Present, :Absent, :Half_day]
end
