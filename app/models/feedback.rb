class Feedback < ApplicationRecord
  belongs_to :user

  enum feedback: [:Best, :Good, :Average, :Bad]
end
